class RenameTableNewPlantsBeds < ActiveRecord::Migration
  def self.up
    rename_table(:plants_of_beds, :plants_beds)

  end

  def self.down
    rename_table( :plants_beds, :plants_of_beds)
  end
end
