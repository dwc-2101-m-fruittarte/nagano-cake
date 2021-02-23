class Order < ApplicationRecord
   belongs_to :customer
   has_many :products, through: :order_products
   has_many :order_products

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]


   def total_price
		total = 0
		order_products.each do |order_product|
			total += order_product.subtotal_price
		end
		total + 800
	end

end
