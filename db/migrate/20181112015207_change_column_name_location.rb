class ChangeColumnNameLocation < ActiveRecord::Migration[5.1]
  def change
  	rename_column :locations, :locacion, :location
  end
end
