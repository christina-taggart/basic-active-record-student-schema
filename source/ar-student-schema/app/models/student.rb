require_relative '../../db/config'

class Student < ActiveRecord::Base
  def name
    self.first_name + " " + self.last_name
  end

  def age
    ((Date.today - self.birthday)/(365.2422)).to_i
  end
end

student = Student.all[0]
p student.name
p student.age