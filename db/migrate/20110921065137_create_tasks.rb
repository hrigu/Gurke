class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.datetime :done_at
      t.string :title
      t.string :body
      t.integer :garden_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
