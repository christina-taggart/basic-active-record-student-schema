require_relative '../config'

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |col|
      col.string :first_name
      col.string :last_name
      col.string :gender
      col.date :birthday
      col.string :email
      col.string :phone
    end
  end
end
