module GardensHelper

  def build_style bed
    left = bed.pos_left
    left ||= 20
    top = bed.pos_top
    top ||= 0

    width = bed.width
    width ||= 150
    height = bed.height
    height || 120
    "position: absolute; left: #{left}px;top: #{top}px; width: #{width}px; height: #{height}px;"
  end
end

