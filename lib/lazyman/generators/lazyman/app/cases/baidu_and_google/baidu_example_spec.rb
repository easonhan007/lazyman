#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

describe 'Baidu example show you how to use lazyman', :baidu do

	before :all do
		@keyword = 'watir-webdriver'
	end

	it 'should search baidu using key word' do
		baidu_page = $navi.goto_baidu_page
		baidu_page.keyword = @keyword
		baidu_page.search_element.click
		result_page = SearchResultPage.new baidu_page.browser
		result_page.first_result.should eq 'watir-webdriver_百度百科'
	end

	it 'should have correct search result' do
		baidu_page = $navi.goto_baidu_page
		result_page = baidu_page.search_for @keyword
		result_page.first_result.should eq 'watir-webdriver_百度百科'
	end

end
