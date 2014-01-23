require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /\A.+@.+\..{2,}\z/,
    :message => "Email must be in proper format" }
  validates :email, :uniqueness => true
  validates :age, :exclusion => { :in => (0..5).to_a,
    :message => "This student is too young" }
  # validates :phone, :format => { :with => /\A\d{10}\z/,
  #   :message => "Phone number must be 10 digits long" }
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