class Product < ApplicationRecord

  attachment :image
  has_many :order_products

end
