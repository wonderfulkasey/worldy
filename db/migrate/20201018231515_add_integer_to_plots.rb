class AddIntegerToPlots < ActiveRecord::Migration[6.0]
  def change
    add_column :plots, :user_id, :integer
    add_column :plots, :world_id, :integer
  end
end
