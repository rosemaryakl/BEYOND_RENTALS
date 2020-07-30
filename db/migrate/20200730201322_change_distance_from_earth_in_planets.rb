class ChangeDistanceFromEarthInPlanets < ActiveRecord::Migration[6.0]
  def change
    change_column :planets, :distance_from_earth, :integer
  end
end
