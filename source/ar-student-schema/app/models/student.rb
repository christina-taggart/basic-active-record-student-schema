require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    ((Date.today - self.birthday)/365).to_i
  end
end