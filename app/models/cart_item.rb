class CartItem < ApplicationRecord

  validates :quantity, presence: true
  belongs_to :customer
  belongs_to :product

    def subtotal_price
  		(quantity * product.price * 1.1).round
  	end

end
