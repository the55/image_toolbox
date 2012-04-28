# image_toolbox

  a few tools to work with images in ruby. using rMagick


## extract a color palette from an image

To return a color palette from an image, pass a File or a file path to

    @image = ColorPalette.new(file)
    @image.palette(4)

you'll get an array of hex values. for the average color of an image, just call palette with 1.

credit to: https://github.com/arkadyan/color_palette


## the average of several images

pass a directory path, or an array of file paths to

    @image = AverageImage.new(dir).image("./output_file_name.png", width, height)


