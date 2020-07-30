class RemoveBooleanFromPlanet < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :boolean, :string
  end
end
