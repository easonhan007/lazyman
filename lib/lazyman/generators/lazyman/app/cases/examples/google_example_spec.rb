#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'

describe 'Google example show you how to use lazyman', :google do

	before :all do
		@keyword = 'watir-webdriver'
	end

	it 'should have correct search result' do
		google_page = $navi.goto_google_page
		result_page = google_page.search_for @keyword
		result_page.first_result.should eq 'Watir WebDriver | the most elegant way to use webdriver with ruby'
	end

end
