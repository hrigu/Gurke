module GardensHelper

  def build_style bed
    left = bed.pos_left
    left ||= 20
    top = bed.pos_top
    top ||= 0
    "position: absolute; left: #{left}px;top: #{top}px;"
  end
end
