require_relative '../../db/config'

class Student < ActiveRecord::Base
  def name
    self[:first_name]+ " " + self[:last_name]
  end
  def age
    days = (Date.today - self[:birthday]).to_i
    days/365
  end

end



# Create a class called Student (in the app/models/student.rb file) that meets the following requirements:

# User Stories

# Given a Student model object, I should be able to easily retrieve her full name via a name method.
# Given a Student model object, I should be able to easily know her age (in years) via an age method.
# Don't overcomplicate this! From this user story, we can infer that student.name would likely be the
#  syntax to access the name method. What can we infer is needed in the Student Class?