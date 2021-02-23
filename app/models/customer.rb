class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :deliveries

  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal_price
    end
    total
  end
 # validates :family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, presence: true
  #validates :is_deleted, inclusion:{in: [true, false]}
end

