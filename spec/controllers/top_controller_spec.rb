require 'spec_helper'

describe TopController do
	fixtures :themes, :users, :contributors

	context "when getting zero theme on GET indexBt" do
		before do
			Theme.stub!(:all).and_return([])
		end
		it 'renders themes/new_bt' do
			get :indexBt
			expect(response).to redirect_to newBt_themes_path
		end
	end

	context "when getting some themes on GET indexBt" do
		it 'renders top/index_bt' do
			get :indexBt
			expect(response).to render_template 'top/index_bt'
		end
	end

	it 'show the specified theme and mentions on it' do
		get :showBt, :theme_id => 1
		expect(response).to render_template 'top/index_bt'
	end

end
