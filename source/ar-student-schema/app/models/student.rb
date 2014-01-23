require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  validates :email, :format { :with => /[\d\w]+@[\d\w]+\.\w{2,}/,
    :message => "Not Valid Email"}
  validates :email, :uniqueness => true
  validate :cannot_be_five
  validate :is_valid_phone


  def is_valid_phone
    pn = phone.split("")
    pn.each do |chr|
      pn.delete(chr) unless chr.match(/\d/) != nil
    end
    pn = pn.join("")
    errors.add(:phone, "invalid phone!") if phone != nil && pn.length < 10
  end

  def cannot_be_five
    if age <= 5
      errors.add(:birthday, "too young!")
    end
  end


  def name
    "#{self.first_name}" + " #{self.last_name}"
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