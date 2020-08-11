class ChangeHasOxygenOnPlanets < ActiveRecord::Migration[6.0]
  def change
    change_column_default :planets, :has_oxygen, nil
  end
end
