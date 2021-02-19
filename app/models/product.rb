class Product < ApplicationRecord
  has_many :order_products
  has_many :cart_items

  attachment :image
  has_many :cart_items, dependent: :destroy

end
