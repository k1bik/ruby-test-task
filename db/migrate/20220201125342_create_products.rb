class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.float :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.string :departure
      t.string :destination

      t.timestamps
    end
  end
end
