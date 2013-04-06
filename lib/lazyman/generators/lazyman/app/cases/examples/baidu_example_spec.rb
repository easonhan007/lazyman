#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

describe 'An example show you how to use lazyman' do

	it 'should search baidu using key word' do
		baidu_page = @navi.goto_baidu_page
		baidu_page.keyword = 'watir-webdriver'
		baidu_page.search.click
	end

end
