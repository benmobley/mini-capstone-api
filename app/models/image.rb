class Image < ApplicationRecord
  belongs_to :product

  validates :url, presence: true
  validates :url, uniqueness: true
end
