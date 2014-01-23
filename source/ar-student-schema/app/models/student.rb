require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  def name
    "#{self[:first_name]} #{self[:last_name]}"
  end

  def age
    age = (Date.today - self[:birthday]).to_i
    age/365.25.to_i
  end

  validate :toddler?
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: true
  validate :valid_phone?


  def toddler?
    errors.add(:age, "too young") if age <= 3
  end

  def valid_phone?
    errors.add(:phone, "invalid number") if self[:phone].scan(/\d/).count < 10
  end


end

