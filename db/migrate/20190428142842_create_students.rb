class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :user_id
      t.string :key_person
      t.string :room
    end
  end
end
