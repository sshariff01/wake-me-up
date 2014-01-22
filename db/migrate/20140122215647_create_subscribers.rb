class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :phone_number
      
      t.timestamps
    end
  end
end
