require 'spec_helper'

describe MentionsController do
	context 'POST "createBt"' do
		before do
			@mention = {:user_id => 1, :content => 'dummy', :theme_id => 1}
		end
		it 'create a mention' do
			expect {
				post :createBt, :mention => @mention
			}.to change { Mention.count }.by(1)			
		end
	end
end
