class AddIntegerToWorlds < ActiveRecord::Migration[6.0]
  def change
    add_column :worlds, :user_id, :integer
  end
end
