class ProductsController < ApplicationController
  before_action :current_user
  before_action :confirm_logged_in

  def index
    @products = Product.all
  end

  def edit
    only_admin
    @product = Product.find(params[:id])

  end

  def show
    only_admin
    @product = Product.find(params[:id])
  end

  def new
    only_admin
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:success] = "Product created"
      redirect_to products_path
    else
      render :new
    end

  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes (product_params)
    if @product.save
      flash[:success] = "Product updated"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Product deleted"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :category, :price)
  end

  def only_admin
    if session[:is_admin] != true
      redirect_to products_path
    end
  end
end
