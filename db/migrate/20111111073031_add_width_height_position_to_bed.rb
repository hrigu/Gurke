class AddWidthHeightPositionToBed < ActiveRecord::Migration
  def change
    add_column :beds, :width, :int
    add_column :beds, :height, :int
    add_column :beds, :pos_left, :int
    add_column :beds, :pos_top, :int
  end
end
