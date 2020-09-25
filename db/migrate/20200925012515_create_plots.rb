class CreatePlots < ActiveRecord::Migration[6.0]
  def change
    create_table :plots do |t|

      t.timestamps
    end
  end
end
