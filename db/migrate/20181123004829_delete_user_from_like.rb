class DeleteUserFromLike < ActiveRecord::Migration[5.1]
  def change
  	remove_column :likes, :user
  end
end
