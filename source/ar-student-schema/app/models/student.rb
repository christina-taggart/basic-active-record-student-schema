require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /.+@.+\..{2,}/, :message => "This email doesn't work." }
  validates :email, :uniqueness => true
  validate :person_must_be_5
  validate :validate_phone

  def name
    self.first_name + " " + self.last_name
  end

  def age
   ((Date.today - self.birthday)/365).to_i
  end

  def person_must_be_5
    errors.add(:birthday, "This person must be older than 5.") if self.age < 5
  end

  def validate_phone
    errors.add(:phone, "Phone numbers must be 10 or more digits long") if phone.scan(/\d/).length < 10
  end
end