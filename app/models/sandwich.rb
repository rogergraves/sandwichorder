class Sandwich < ActiveRecord::Base
  validates :name, :presence => true
end
