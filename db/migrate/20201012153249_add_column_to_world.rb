class AddColumnToWorld < ActiveRecord::Migration[6.0]
  def change
    add_column :worlds, :name, :string
    add_column :worlds, :description, :text
  end
end
