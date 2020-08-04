class AddAcceptedToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :accepted, :boolean, default: false
  end
end
