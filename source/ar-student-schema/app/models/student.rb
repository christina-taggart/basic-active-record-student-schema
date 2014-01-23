require_relative '../../db/config'

class Student < ActiveRecord::Base
  # attr_reader :first_name, :last_name, :birthday
  # def initialize(args = {})
  #   @first_name = args[:first_name]
  #   @last_name = args[:last_name]
  #   @gender = args[:gender]
  #   @birthday = args[:birthday]
  #   @email = args[:email]
  #   @phone = args[:phone]

  # end

  def name
    self.first_name + " " + self.last_name
  end

  def age
    2014 - self.birthday.year - 1
   #now.year - @student.birthday.year - ((now.month > @student.birthday.month || (now.month == @student.birthday.month && now.day >= @student.birthday.day))
  end
end

# vals = {first_name: "David", last_name: "Goodman", gender: "male", birthday: 1989, email: "thisisemail@something.com", phone: "627-383-7125"}
# me = Student.new(vals)
# p me.name
# p me.age
