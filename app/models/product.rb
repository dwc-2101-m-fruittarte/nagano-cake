class Product < ApplicationRecord
  has_many :order_products

  attachment :image
  has_many :cart_items, dependent: :destroy

  enum is_active: [:販売中, :販売停止中]

end
