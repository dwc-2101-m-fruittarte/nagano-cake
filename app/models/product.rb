class Product < ApplicationRecord

  has_many :order_products
  belongs_to :genre
  attachment :image
  has_many :cart_items, dependent: :destroy

end