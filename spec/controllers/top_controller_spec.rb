require 'spec_helper'

describe TopController do

	describe "getting zero theme when GET 'indexBt'" do

		it 'redirect to themes/new_bt' do
			get 'indexBt'
			expect(response).to render_template 'themes/new_bt'
			end

	end

end
