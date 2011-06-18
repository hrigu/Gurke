class Family < ActiveRecord::Base
  has_many :plants

  validates :name, :presence => true, :uniqueness => true
end
