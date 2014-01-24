require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /[\d\w]+@[\d\w]+\.\w{2,}/ }, :uniqueness => true
  validate :age_check
  validates :phone, :format => { :with => /\D*\d{3}\D*\d{3}\D*\d{4}/ }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    ((Date.today - self.birthday)/365).to_i
  end

  def age_check
    if age < 5
      errors.add(:birthday, "wait a few years")
    end
  end
end