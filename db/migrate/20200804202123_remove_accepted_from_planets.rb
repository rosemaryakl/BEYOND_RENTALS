class RemoveAcceptedFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :accepted, :boolean
  end
end
