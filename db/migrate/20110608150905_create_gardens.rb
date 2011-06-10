class CreateGardens < ActiveRecord::Migration
  def self.up
    create_table :gardens do |t|
      t.string :name
      t.string :place
      t.integer :account_id
      t.timestamps
      add_column :beds, :garden_id, :integer
    end

  end

  def self.down
    drop_table :gardens
    remove_column :beds, :garden_id, :integer
  end
end
