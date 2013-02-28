# encoding: utf-8
require 'spec_helper'

describe MentionsController do

	context '/mentions のPOSTリクエストが送信された時' do

		fixtures :themes, :users, :contributors, :mentions

		
		before do 
			@mention = {:user_id => 1, :content => 'dummy', :theme_id => 1}
		end

		before :each do
			post :create, :mention => @mention
		end

		it '発言一覧画面へリダイレクトされる' do
			response.should be_redirect
			response.should redirect_to(:action => 'show', :theme_id => @mention[:theme_id])
		end

		it '新しい発言が作成される' do
			assigns[:mention].content.should == @mention[:content]
		end
	end

	context '/mentions/[:theme_id] のGETリクエストが送信された時' do
		
		fixtures :themes, :users, :contributors, :mentions

		before do 
			@theme = themes(:theme_01);
		end

		before :each do
			get :show, :theme_id => @theme.id
		end

		it '発言一覧画面が描画される' do
			response.should render_template 'mentions/show'
		end

		it 'テーマに紐づく発言一覧が取得できる' do
			assigns[:theme].mentions.should have_at_least(1).mentions
		end
	end

	context '/mentions/[:id] のDELETEリクエストが送信された時' do

		fixtures :themes, :users, :contributors, :mentions

		before do 
			@mention = mentions(:mention1)
		end

		before :each do
			delete :destroy, :id => @mention.id
		end

		it '発言一覧画面へリダイレクトされる' do
			response.should be_redirect
			response.should redirect_to(:action => 'show', :theme_id => @mention.theme.id)
		end

		it '発言一覧には削除した発言は表示されない' do
			Theme.find(@mention.theme.id).mentions.should_not include @mention
		end
	end

end
