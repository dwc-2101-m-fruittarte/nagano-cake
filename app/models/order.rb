class Order < ApplicationRecord

   has_many :products, through: :order_products
   has_many :order_products
   belongs_to :customer

  enum payment_method: {クレジットカード:0, 銀行振込:1}
end
