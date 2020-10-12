class AddColumnToPlots < ActiveRecord::Migration[6.0]
  def change
    add_column :plots, :title, :string
    add_column :plots, :description, :text
  end
end
