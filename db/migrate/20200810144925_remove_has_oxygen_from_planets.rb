class RemoveHasOxygenFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :has_oxygen, :boolean
  end
end
