class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tags, :ame, :name
  end
end
