#encoding: utf-8
require File.expand_path 'app/cases/spec_helper'
require File.expand_path 'app/cases/shared/login'

describe 'report issue', :mantis do
	context 'login' do
		include_shared 'login'
	end

	context 'report issue' do

		it 'should create report' do
			report_issue_page = $navi.goto_report_issue_page	
			summary = "lazyman test #{Time.now.to_s}"
			desc = "description #{Time.now.to_s}"
			category = 'GUI'

			report_issue_page.create_issue category, summary, desc do |page|
				page.check_report_stay
			end

			view_page = $navi.goto_view_all_bug_page
			view_page.first_row[view_page.summary_column].text.should eq(summary)
		end

	end #context
end
