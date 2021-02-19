class Product < ApplicationRecord
  has_many :order_products

  attachment :image
  has_many :cart_items, dependent: :destroy

end
