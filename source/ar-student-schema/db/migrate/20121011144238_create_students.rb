require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
    def up
    create_table :students do |x|
      x.string :first_name
      x.string :last_name
      x.string :gender
      x.date :birthday
      x.string :email
      x.string :phone

      x.datetime :created_at
      x.datetime :updated_at
        end
      end

      def change
        change_table :students do |z|

      z.string :first_name
      z.string :last_name
      z.string :gender
      z.date :birthday
      z.string :email
      z.string :phone

      z.datetime :created_at
      z.datetime :updated_at
        end
      end

end
