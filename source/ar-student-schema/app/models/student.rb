require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email,
            :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "Only letters allowed" }
  validates :email, :uniqueness => true
  validate :age_cannot_be_less_than_five
  validate :phone_number_must_have_at_leat_ten_digits

  def name
    self.first_name + " " + self.last_name
  end

  def age
    ((Date.today - self.birthday)/(365.2422)).to_i
  end

  def age_cannot_be_less_than_five
    if age < 5
      errors.add(:birthday, "Age cannot be less than 5 years")
    end
  end

  def phone_number_must_have_at_leat_ten_digits
    if self.phone.scan(/\d/).count < 10
      errors.add(:phone, "Phone number must have at least 10 digits")
    end
  end
end