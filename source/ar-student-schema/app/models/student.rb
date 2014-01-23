require_relative '../../db/config'

class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless record.email.match(/.+@.+\..{2,}/)
      record.errors[:base] << "Email is invalid format"
    end
  end
end

class AgeValidator < ActiveModel::Validator
  def validate(record)
    if record.age < 5
      record.errors[:base] << "Student must be at least 5 years old"
    end
  end
end

class PhoneValidator < ActiveModel::Validator
  def validate(record)
    unless record.phone.match(/(\(?\d{3}\)?-?\s?\d{3}-?\s?\d{4}\s?)(x\d{4})?/)
      record.errors[:base] << "Yo phone number is wack"
    end
  end
end

class Student < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with EmailValidator
  validates_with AgeValidator
  validates_with PhoneValidator

  validates :email, :uniqueness => true

  def name
    "#{self[:first_name]} #{self[:last_name]}"
  end

  def age
    age_in_seconds = Time.now - DateTime.parse(self.birthday.to_s)
    age = age_in_seconds / 60 / 60 / 24 / 365
    age.floor
  end




end

