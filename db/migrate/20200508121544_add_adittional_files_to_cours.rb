class AddAdittionalFilesToCours < ActiveRecord::Migration[6.0]
  def change
    add_column :cours, :aditional_files, :json
  end
end
