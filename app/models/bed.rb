class Bed < ActiveRecord::Base
  has_many :plants_beds
  has_many :plants, :through => :plants_beds #, :source => bed
  belongs_to :garden
  attr_accessor :choosen_plants

  validates :name, :presence => true
  
  def possible_plants

    candidates = []
    (Family.find_all_by_field_state self.field_state).each do |family|
      candidates.concat family.plants
    end
    candidates
  end
  
  def to_s
    "#{name} - #{field_state} : possible_plants => #{possible_plants.join " "}"
  end
end
