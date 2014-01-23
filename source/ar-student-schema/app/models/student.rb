require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, presence: true, :uniqueness => true
  validates :email, format: { with: /.+@.+[.].{2,}/,
    message: "Invalid email address" }
  validates_numericality_of :age, :greater_than => 5
  validate :valid_phone?
  def name
    "#{self[:first_name]} #{self[:last_name]}"
  end

  def age
    @age = Date.today.year - self[:birthday].year # 44
    if Date.today.month <= self[:birthday].month
      @age -= 1
    end
    @age
  end

  def valid_phone?
    errors.add(:phone, "must input a phone number") if phone.nil?
    phone_stripped = phone.gsub(/\D/, "")
    if !phone_stripped.nil? && phone_stripped.length < 10
      errors.add(:phone, "is not valid!")
    end
  end

end