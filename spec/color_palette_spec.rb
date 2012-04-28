require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ColorPalette" do
  before do
    file = File.expand_path(File.dirname(__FILE__) + '/test.jpg')
    @image = ColorPalette.new(file)
  end

  it "return an array" do
    @image.palette(4).size.should == 4
  end

  it 'should do hex' do
    @image.palette(8).all?{|color| color.match(/\#\w{6}/)}
  end
end
