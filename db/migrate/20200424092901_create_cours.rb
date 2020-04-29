class CreateCours < ActiveRecord::Migration[6.0]
  def change
    create_table :cours do |t|
      t.string :name
      t.string :file
      t.string :img
      t.text :description
      t.text :category
      t.text :level

      t.timestamps
    end
  end
end
