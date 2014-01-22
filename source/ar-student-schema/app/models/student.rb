require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
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