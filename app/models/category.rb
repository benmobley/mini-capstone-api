class Category < ApplicationRecord
  has_many :category_products, dependent: :destroy

  has_many :products, through: :category_products
  #   def products
  #     category_products.map do |category_product|
  #       Product.find_by(id: category_product.product_id)
  #     end
  #   end
end
