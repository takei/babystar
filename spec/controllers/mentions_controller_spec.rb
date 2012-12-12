require 'spec_helper'

describe MentionsController do
	context 'POST "createBt"' do
		before do
			@mention = Mention.new :user_id => 1, :content => 'dummy' 
		end
		it 'create a mention' do
			expect {
				post :createBt, :mention => @mention
			}.to change { Mention.count }.by(1)			
		end
	end
end
