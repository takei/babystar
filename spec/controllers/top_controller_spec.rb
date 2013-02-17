require 'spec_helper'

describe TopController do

	it 'renders top/index' do
		get :index
		expect(response).to render_template 'top/index'
	end

end
