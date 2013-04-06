require 'spec_helper'

describe Lazyman::Initializer do

	it 'should load all components' do
		Lazyman::Initializer.new File.dirname(__FILE__)
		
		lambda {Footer}.should_not raise_error
		lambda {SubFooter}.should_not raise_error
	end

	it 'should load all pages' do
		Lazyman::Initializer.new File.dirname(__FILE__)
		
		lambda {Module1Page}.should_not raise_error
		lambda {CustomModule1Page}.should_not raise_error
	end

	it 'should load config' do
		Lazyman::Initializer.new File.dirname(__FILE__)
		$config.host.should eq('www.example.com')
	end

end
