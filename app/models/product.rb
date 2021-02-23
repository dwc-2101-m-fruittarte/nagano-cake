class Product < ApplicationRecord
  has_many :order_products

  attachment :image
  has_many :cart_items, dependent: :destroy

  enum is_active: [:販売中, :販売停止中]

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all #全て表示。
    end
  end

end
