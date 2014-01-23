require_relative '../../db/config'

class Student < ActiveRecord::Base
   validates :email, :uniqueness => true, :format => { :with => /.\@.+\.../, :message => "Not a valid email"}
   #validates :email, :format => { :with => /.\@.+\.../, :message => "Not a valid email"}
   validate :person_must_be_5_years_old
   validates :phone, :format => { :with => /.\d{3}.\s\d{3}.\d{4}\s.\d{4}/, :message => "Not a valid phone number"}

  def person_must_be_5_years_old
     if self.age < 5
      errors.add(:birthday, "This person is too young, must be over 5")
    end
  end

  def name
    self.first_name + " " + self.last_name
  end

  def age
    2014 - self.birthday.year - 1
  end

end

# vals = {first_name: "David", last_name: "Goodman", gender: "male", birthday: 1989, email: "thisisemail@something.com", phone: "627-383-7125"}
# me = Student.new(vals)
# p me.name
# p me.age
