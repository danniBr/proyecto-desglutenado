class ChangeColumnNameLike < ActiveRecord::Migration[5.1]
  def change
  	rename_column :likes, :user_id, :user
  end
end
