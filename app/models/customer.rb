class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders

  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal_price
    end
    total
  end
 # validates :family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, presence: true
  #validates :is_deleted, inclusion:{in: [true, false]}

  enum is_deleted: {Invalid: true, Available: false}
    #有効会員はtrue、退会済み会員はfalse

    def active_for_authentication?
        super && (self.is_deleted === "Invalid")
    end
    #is_activeが有効の場合は有効会員(ログイン可能)
end

