class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :photo
      t.integer :cant
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
