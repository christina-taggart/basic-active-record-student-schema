require_relative '../../db/config'
require 'date'
class Student < ActiveRecord::Base

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end

student = Student.new(first_name: 'Bob', last_name: 'Saget', birthday: Date.new(1984,3,22))
p student.age