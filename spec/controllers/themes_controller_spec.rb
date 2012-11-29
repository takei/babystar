require 'spec_helper'

describe ThemesController do

	it 'show the form to create theme' do
		get :newBt
		expect(response).to render_template 'themes/new_bt'
	end

	it 'create a theme on POST "create"' do
		theme = Theme.new :name => 'dummy'
		expect { 
			post :create, :theme => theme
		}.to change{ Theme.count }.by(1)
	end
end
