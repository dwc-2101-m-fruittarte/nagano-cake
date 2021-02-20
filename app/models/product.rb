class Product < ApplicationRecord

  attachment :image

  has_many :order_products
  has_many :cart_items, dependent: :destroy

end
