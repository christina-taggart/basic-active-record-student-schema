require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /[\d\w]+@[\d\w]+\.\w{2,}/ }, :uniqueness => true
  validates_numericality_of :age, {:greater_than_or_equal_to => 5}
  validates :phone, :format => { :with => /\D*\d{3}\D*\d{3}\D*\d{4}/ }
  def name
    self.first_name << " " << self.last_name
  end

  def age
    (Date.today - birthday).to_i / 365
  end
end