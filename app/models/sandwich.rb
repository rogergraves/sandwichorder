class Sandwich < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
end
