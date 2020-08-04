class AddStatusToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :status, :boolean, default: false
  end
end
