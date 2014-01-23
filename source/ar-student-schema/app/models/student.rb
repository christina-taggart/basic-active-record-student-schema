require_relative '../../db/config'

class Student < ActiveRecord::Base
  def name
    "#{self[:first_name]} #{self[:last_name]}"
  end
  def age
    age = Date.today.year - self[:birthday].year # 44
    if Date.today.month <= self[:birthday].month
      age -= 1
    end
    age
  end
end