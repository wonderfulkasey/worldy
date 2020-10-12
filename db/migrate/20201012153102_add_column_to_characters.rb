class AddColumnToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :name, :string
    add_column :characters, :species, :string
    add_column :characters, :description, :string
    add_column :characters, :type, :string
  end
end
