class Product < ActiveRecord::Base
  has_many :order_products
  has_many :orders, through: :order_products
  validates :name, :category,
    presence: true,
    length: {minimum: 4}

  validates :price,
    numericality: true,
    presence: true

end
