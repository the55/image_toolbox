require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AverageImage" do
  before do
    dir = File.expand_path(File.dirname(__FILE__))
    @image = AverageImage.new(dir).image("./test_#{Time.now.to_i}.png", 300,200)
  end

  it "return a path" do
    @image.should.be String
  end
end
