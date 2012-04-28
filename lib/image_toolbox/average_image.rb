class AverageImage
  def initialize(data)
    @data = if data.is_a? String
      Dir.new(data).select &:image_file?
    elsif data.is_a?(Array)
      data.select &:image_file?
    else
      raise ArgumentError.new('please supply a dirname as your argument')
    end
  end

  def image(file_path, width, height)
    pixels = average_pixels(size_normalized_images(width, height))
    colors = pixels.flatten.map{|pixel| pixel.to_rgb_array[0,3]}.flatten
    # binding.pry
    a =Image.constitute(width, height, 'RGB', colors)
    a.write(file_path) { self.quality = 75 }
  end

  private

  def all_images
    @images ||= @data.map{|filename| Image.read(filename).first}
  end

  def size_normalized_images width, height
    all_images.map{|image| image.resize_to_fill width, height}
  end

  def average_pixels images
    pixels = [].tap do |pixels|
      images.each do |image|
        image.each_pixel do |pixel, row, col|
          pixels[col] ||= []
          pixels[col][row] ||= []
          pixels[col][row].push pixel
        end
      end
    end
    pixels.map{|col| col.map{|point| average_color(point)}}
  end
end
