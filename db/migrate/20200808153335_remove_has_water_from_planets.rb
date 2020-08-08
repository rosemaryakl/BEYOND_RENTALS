class RemoveHasWaterFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :has_water, :string
  end
end
