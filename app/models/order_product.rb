class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum make_status: [:着手不可, :製作待ち, :製作中, :製作完了]

  def subtotal_price
		tax_in_price * quantity
	end

end
