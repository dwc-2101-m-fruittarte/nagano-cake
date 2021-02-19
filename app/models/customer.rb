class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cart_items, dependent: :destroy
  has_many :orders

 # validates :family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, presence: true
  #validates :is_deleted, inclusion:{in: [true, false]}
end

