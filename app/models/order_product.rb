class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def subtotal_price
		tax_in_price * quantity
	end

end
