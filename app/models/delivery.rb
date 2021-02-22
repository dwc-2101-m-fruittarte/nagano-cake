class Delivery < ApplicationRecord

  belongs_to :customer

  # enum address: {登録済み住所:0, 新規登録住所:1, 新規配送先住所:2}
  def display_address
    self.postcode + " " + self.address + " " + self.name
  end

end