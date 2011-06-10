class Garden < ActiveRecord::Base
  attr_accessible :name, :place
  has_many :beds
  belongs_to :account
end
