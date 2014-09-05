require 'test_helper'

describe Paperclip::SmartDataUriAdapter do

  subject { Paperclip::SmartDataUriAdapter.new(data_uri) }

  describe "when given a png file" do
    let(:data_uri) { "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==" }

    it "guesses a file name with a proper extension" do
      subject.original_filename.must_equal "file.png"
    end
  end

  describe "when given a gif file" do
    let(:data_uri) { "data:image/gif;base64,R0lGODlhEAAOALMAAOazToeHh0tLS/7LZv/0jvb29t/f3//Ub//ge8WSLf/rhf/3kdbW1mxsbP//mf///yH5BAAAAAAALAAAAAAQAA4AAARe8L1Ekyky67QZ1hLnjM5UUde0ECwLJoExKcppV0aCcGCmTIHEIUEqjgaORCMxIC6e0CcguWw6aFjsVMkkIr7g77ZKPJjPZqIyd7sJAgVGoEGv2xsBxqNgYPj/gAwXEQA7" }

    it "guesses a file name with a proper extension" do
      subject.original_filename.must_equal "file.gif"
    end
  end

end
