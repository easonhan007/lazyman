require 'spec_helper'

describe LazyConfig do
	before do
		@valid_file = config_file('config.yml')
		@content = {host: 'www.example.com'}
	end

	it 'should raise error when initialized with a missing file' do
		lambda {LazyConfig.new('not_exist_file')}.should raise_error(ConfigFileMissingError)
	end

	it 'should NOT raise error when initialized with an exist file' do
		lambda {LazyConfig.new(@valid_file)}.should_not raise_error(ConfigFileMissingError)
	end

	it 'should load yaml file correctly' do
		puts LazyConfig.new(@valid_file).hash_content['host']
		LazyConfig.new(@valid_file).hash_content['host'].should eql('www.example.com')
	end

	it 'should init an OpenStruct object correctly' do
		c = LazyConfig.new(@valid_file).content
		c.host.should eql('www.example.com')
		c.is_a?(OpenStruct).should be_true
	end
end
