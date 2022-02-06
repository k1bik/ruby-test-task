class AddDistanceAndPriceAndChangePhoneType < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :phone, :integer
  end

  def down
    change_column :users, :phone, :string

    add_column :products, :price, :float
    add_column :products, :distance, :integer
  end
end
