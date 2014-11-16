class OrdersController < ApplicationController
  before_action :current_user
  before_action :confirm_logged_in

  def index
    prevent_user
    @orders = User.find_by_id(params[:user_id]).orders
  end

  def show
    prevent_user
    @order = Order.find(params[:order_id])
  end

  def edit
    prevent_user
    @order = Order.find(params[:order_id])
  end

  def new
    prevent_user
    @order = Order.new
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)
    if params[:product_ids].present?
      for id in params[:product_ids]
        @order.order_products.build(product_id: id)
      end
    end
    if @order.save
      redirect_to orders_path, notice: "Order saved"
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :user_id)
  end

  # Only admins and current users can see their orders page
  def prevent_user
    if session[:is_admin] != true and params[:user_id].to_i != @current_user.id
      redirect_to products_path
    end
  end
end
