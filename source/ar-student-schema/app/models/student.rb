require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i, :message => "bad email" }
  validates :email, :uniqueness => true
  validate :cannot_be_toddler
  validate :is_valid_phone

  def is_valid_phone
    pn = phone.split("")
    pn.each do |chr|
      pn.delete(chr) unless chr.match(/\d/) != nil
    end
    pn = pn.join("")
    errors.add(:phone, "invalid phone!") if phone != nil && pn.length < 10
  end

  def cannot_be_toddler
    if age <= 3
      errors.add(:birthday, "too young!")
    end
  end

  def name
    self.first_name + " " + self.last_name
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end