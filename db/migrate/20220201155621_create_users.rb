class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :patronymic
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
