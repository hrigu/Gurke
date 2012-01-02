class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :name
      t.string :energy
      t.string :field_state
      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
