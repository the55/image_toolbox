module ImageToolbox
  VERSION = '1.0.0'

  def average_color colors
    Pixel.new colors.collect(&:red).inject(:+)/colors.size,
      colors.collect(&:green).inject(:+)/colors.size,
      colors.collect(&:blue).inject(:+)/colors.size
  end
end
include ImageToolbox

require 'RMagick'
include Magick
require 'image_toolbox/color_palette'
require 'image_toolbox/average_image'


class String
  def image_file?
    match(/(jpg|jpeg|png|tif|tiff|gif)$/)
  end
end

class Magick::Pixel
  def to_hex
    to_color(AllCompliance, false, 8)
  end

  def to_rgb_array
    [red, green, blue, opacity]
  end
end