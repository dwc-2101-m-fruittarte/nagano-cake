class Order < ApplicationRecord

   has_many :products, through: :order_products
   has_many :order_products
   belongs_to :customer

  enum payment_method: {クレジットカード:0, 銀行振込:1}
  # enum address: {登録済み住所:0, 新規登録住所:1, 新規配送先住所:2}
  def display_address
    self.postcode + " " + self.address + " " + self.name
  end


   def total_price
		total = 0
		order_products.each do |order_product|
			total += order_product.subtotal_price
		end
		total + 800
	end

end
