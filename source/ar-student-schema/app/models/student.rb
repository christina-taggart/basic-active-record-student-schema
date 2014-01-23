require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :email, :uniqueness => true
  validates :email,
            :format => {
              :with    => /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i,
              :message => "Invalid email" }
  validate :older_than_five
  validate :phone_digits

  def name
    self.first_name + " " + self.last_name
  end

  def age
    ((Date.today - self.birthday) / (365.25)).to_i
  end

  def older_than_five
    errors.add(:age, "must be older than five") if age < 5
  end

  def phone_digits
    errors.add(:birthday, "Number must be 10 digits") if self.phone.scan(/\d/).count < 10
  end


end




