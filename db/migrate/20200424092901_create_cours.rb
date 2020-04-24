class CreateCours < ActiveRecord::Migration[6.0]
  def change
    create_table :cours do |t|
      t.string :name
      t.text :description
      t.text :category

      t.timestamps
    end
  end
end
