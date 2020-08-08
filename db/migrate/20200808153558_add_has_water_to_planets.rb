class AddHasWaterToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :has_water, :boolean
  end
end
