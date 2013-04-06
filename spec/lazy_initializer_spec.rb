require 'spec_helper'

describe Lazyman::Initializer do
	before do
		@app_name = 'test'
		Lazyman::Initializer.new File.dirname(__FILE__), @app_name
	end

	it 'should load app page and navigator' do
		lambda {TestPage}.should_not raise_error
		lambda {TestNavigator}.should_not raise_error
	end

	it 'should load all components' do
		lambda {Footer}.should_not raise_error
		lambda {SubFooter}.should_not raise_error
	end

	it 'should load all pages' do
		lambda {Module1Page}.should_not raise_error
		lambda {CustomModule1Page}.should_not raise_error
	end

	it 'should load config' do
		$config.host.should eq('www.example.com')
	end

end
