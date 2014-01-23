require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :gender, :null => false
      t.date :birthday, :null => false
      t.string :email, :null => false
      t.string :phone, :null => false
    end
  end
end
