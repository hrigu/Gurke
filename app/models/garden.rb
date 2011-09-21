class Garden < ActiveRecord::Base
  attr_accessible :name, :place
  has_many :beds
  belongs_to :account
  has_many :tasks

  validates :name, :presence => true
  validates :place, :presence => true

end
