class CreateCoursUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :cours_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
