class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :hour
      t.string :minute
      
      # Assocation with Subscriber model
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
