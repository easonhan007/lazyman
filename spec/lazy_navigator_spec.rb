require 'spec_helper'
require 'ostruct'
require 'pages/test_page'

describe Lazyman::Navigator do
	before do
		@config = OpenStruct.new( browser: 'chrome') 
	end

	it 'should raise error when config file does not define browser attribute' do
		lambda {Lazyman::Navigator.new(Object.new)}.should raise_error(Lazyman::IncorrectConfigFileError)
	end

	it 'should start browser successfully' do
		Watir::Browser.stub(:new).and_return('browser')
		Watir::Browser.should_receive(:new)
		Lazyman::Navigator.new(@config)	
	end

	it "should be lazyman page" do
		Watir::Browser.stub(:new).and_return('browser')
		Watir::Browser.should_receive(:new)
		navi = Lazyman::Navigator.new(@config)	
		navi.lazyman_page?(:CustomTestPage).should be_true
		navi.lazyman_page?(:TestPage).should be_true
	end

	it 'should define goto methods for navigator' do
		Watir::Browser.stub(:new).and_return('browser')
		Watir::Browser.should_receive(:new)
		navi = Lazyman::Navigator.new(@config)	
		navi.should respond_to(:goto_test_page)
		navi.should respond_to(:goto_custom_test_page)
	end

end
