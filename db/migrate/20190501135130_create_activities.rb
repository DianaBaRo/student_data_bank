class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :date
      t.integer :user_id
      t.integer :student_id
      t.string :breakfast
      t.string :morning_snacks
      t.string :lunch
      t.string :afternoon_snacks
      t.string :sleep
      t.string :nappies
      t.text :comments
    end
  end
end
