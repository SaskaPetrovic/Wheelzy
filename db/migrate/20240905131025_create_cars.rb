class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year_of_production
      t.string :address
      t.decimal :price_per_day
      t.string :image
      t.decimal :rating

      t.timestamps
    end
  end
end
