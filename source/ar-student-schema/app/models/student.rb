require_relative '../../db/config'

class Student < ActiveRecord::Base
  I18n.enforce_available_locales = false
  validates :email, :format => {:with => /[\d\w]+@[\d\w]+\.\w{2,}/}, :uniqueness => true
  validates :age, :numericality => {:greater_than_or_equal_to => 5}
  validate :phone_digit_length

  def name
    [first_name, last_name].join(" ")
  end

  def age
    ((Date.today - birthday)/365.2422).to_i
  end

  def phone_digit_length
    errors.add(:phone, "Phone numbers must be 10 or more digits long") if phone.scan(/\d/).length < 10
  end
end
