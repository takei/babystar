require 'spec_helper'

describe TopController do
	fixtures :themes, :users, :contributors

	context "when getting zero theme on GET indexBt" do
		before do
			Theme.stub!(:all).and_return([])
		end
		it 'renders themes/new_bt' do
			get :indexBt
			expect(response).to render_template 'themes/new_bt'
		end
	end

	context "when getting some themes on GET indexBt" do
		it 'renders top/index_bt' do
			get :indexBt
			expect(response).to render_template 'top/index_bt'
		end
	end

end
