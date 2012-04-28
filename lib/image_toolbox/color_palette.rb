require 'pry'
class ColorPalette
  def initialize file
    set_image file
  end

  def palette number=8
    extract_colors number, 'hex'
  end

  private

  def set_image file
    file = File.open(file) if file.is_a? String

    img_array = Image.read file

    # Check that there's at least one image
    raise RuntimeError.new("Not a valid image.") if img_array.size < 1

    # Get the first image (we'll only deal with one)
    @image = img_array[0]
  end

  def extract_colors number, as
    # Reduce the number of colors in the image to match the number we'll output.
    # Don't dither the image.
    quantized = @image.quantize(number, Magick::RGBColorspace, false)

    # Get the histogram of all the colors, sorting by descending value
    hist = quantized.color_histogram.sort {|a,b| b[1]<=>a[1]}
    format_colors hist, as
  end

  def format_colors hist, as
    case as
    when 'hex'
      hist.map {|key, value| key.to_hex}
    else
      ArgumentError.new('just hex for now')
    end
  end
end
