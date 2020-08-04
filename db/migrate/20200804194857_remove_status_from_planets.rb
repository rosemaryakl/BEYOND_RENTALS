class RemoveStatusFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :status, :boolean
  end
end
