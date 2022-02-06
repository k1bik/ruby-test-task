class ChangeDataTypePhonePriceDistance < ActiveRecord::Migration[7.0]
  def self.up
    change_table :products do |t|
      t.change :distance, :integer
      t.change :price, :integer
    end

    change_table :users do |t|
      t.change :phone, :string
    end
  end
  def self.down
    change_table :products do |t|
      t.change :distance, :float
      t.change :price, :float
    end

    change_table :users do |t|
      t.change :phone, :integer
    end
  end
end
