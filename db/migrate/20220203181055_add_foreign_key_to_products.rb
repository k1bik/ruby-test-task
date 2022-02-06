class AddForeignKeyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference(:products, :user, type: :integer)
  end
end
