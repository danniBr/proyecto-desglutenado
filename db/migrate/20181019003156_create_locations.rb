class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.text :description
      t.string :locacion

      t.timestamps
    end
  end
end
