class ChangeDataIsActiveToProducts < ActiveRecord::Migration[5.2]
  
  def change
    change_column :products, :is_active, :integer
  end
  
end
