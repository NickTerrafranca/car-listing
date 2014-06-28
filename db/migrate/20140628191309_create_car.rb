class CreateCar < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year, null: false
      t.string :mileage, null: false
      t.string :color, null: false
      t.text :description
      t.integer :manufacturer_id, null: false
      t.timestamps
    end
  end
end
