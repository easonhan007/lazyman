require 'spec_helper'

describe Lazyman::Page do
	before :all do
		@app_name = 'test'
		Lazyman::Initializer.new File.dirname(__FILE__), @app_name
	end

	before(:each) do
		@browser = mock_watir_browser
	end
	
	def mock_watir_browser
		watir_browser = double('watir')
		watir_browser.stub!(:is_a?).with(anything()).and_return(false)
		watir_browser.stub!(:is_a?).with(Watir::Browser).and_return(true)
		watir_browser
	end

	it 'method missing' do
		@browser.stub :close
		@browser.should_receive :close
		Lazyman::Page.new(@browser).close
	end

	it 'should turn to page' do
		p = Lazyman::Page.new(@browser).turn_to TestPage
		p.is_a?(TestPage).should be_true
	end
	
end
