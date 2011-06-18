class Garden < ActiveRecord::Base
  attr_accessible :name, :place
  has_many :beds
  belongs_to :account

  validates :name, :presence => true
  validates :place, :presence => true

end
