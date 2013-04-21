shared_examples 'login' do
	it 'should login' do
		data = test_data('login_user')
		user = data['demo']['name']
		password = data['demo']['password']
		
		login_page = $navi.goto_login_page
		my_view_page = login_page.login user, password
		my_view_page.report_issue?.should be_true
	end 
end 
