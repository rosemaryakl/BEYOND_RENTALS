class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :size
      t.text :description
      t.bigint :distance_from_earth
      t.integer :price_per_day
      t.boolean :inhabited
      t.boolean :has_oxygen
      t.boolean :has_wifi
      t.string :has_water
      t.string :boolean
      t.boolean :has_starbucks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
