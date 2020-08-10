class AddHasOxygenToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :has_oxygen, :boolean
  end
end
