class AddBodyToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :body, :string
  end
end
