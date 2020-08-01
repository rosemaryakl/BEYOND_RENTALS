class ChangeColumnOnPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :distance_from_earth
    add_column :planets, :distance_from_sun, :integer
  end
end
