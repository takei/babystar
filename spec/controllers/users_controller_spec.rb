require 'spec_helper'

describe UsersController do
	fixtures :users
	context 'POST "create"' do
		before do
			@user = {:name => 'dummy name', :email => 'dummy email'}
		end
		it 'redirect to newBt_themes_path when referer is newBt_themes_path' do
			page = {:is_request_from_new_theme => "true"}
			post :create, :user => @user, :page => page
			expect(response).to redirect_to newBt_themes_path
		end
		it 'redirect to users_path when referer is not newBt_themes_path' do
			page = {:is_request_from_new_theme => "false"}
			post :create, :user => @user, :page => page
			expect(response).to redirect_to user_path(User.all.size())
		end
	end
end
