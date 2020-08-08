class RemoveImageFromPlanets < ActiveRecord::Migration[6.0]
  def change
    remove_column :planets, :image, :string
  end
end
