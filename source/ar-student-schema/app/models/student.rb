require_relative '../../db/config'
require 'date'


class AgeValidator < ActiveModel::Validator
  def validate(student)
    if student.age < 5
      student.errors[:base] << "Student must be at least 5 years old"
    end
  end
end

class PhoneValidator < ActiveModel::Validator
  def validate(student)
    phone_digits = student.phone.gsub(/\D/, "")
    unless phone_digits =~ /\d{10,}/
      student.errors[:base] << "Phone number must contain at least 10 digits"
    end
  end
end


class Student < ActiveRecord::Base
  validates :email, :format => { :with => /.+@.+\..{2,}/ }
  validates :email, :uniqueness => true
  validates_with PhoneValidator
  validates_with AgeValidator

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    now = Time.now.to_date
    now.year - self.birthday.year - (bday_already? ? 1 : 0)
  end

  private

  def bday_already?
    now = Time.now.to_date
    self.birthday.to_date.change(:year => now.year) > now
  end
end