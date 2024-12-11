class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 1..5000 }
  validates :quantity, presence: true

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end

  belongs_to :supplier
  has_many :images, dependent: :destroy
  has_many :orders, through: :carted_products
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
end
