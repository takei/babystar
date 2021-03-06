# coding: utf-8
require 'spec_helper'

describe ThemesController do
  fixtures :themes, :users

  context 'when delete a theme' do
    before do
      @theme = themes(:theme_02)
    end
    it 'delete theme and mentions in it' do
      expect {
        post :destroy, :id => @theme.id
      }.to change { Theme.count }.by(-1)
    end
    it 'redirect to theme-list' do
      post :destroy, :id => @theme.id
      expect(response).to redirect_to themes_path
    end
  end

	it 'show the form to create theme' do
		get :new
		expect(response).to render_template 'themes/new'
	end

  context 'when success on save' do
    before do
      user_id = users(:user_01)
      @params = {:name => 'dummy', :description => 'dummy', :users => [user_id]}
    end
    it 'create a theme on POST "create"' do
      expect { 
        post :create, :theme => @params
      }.to change { Theme.count }.by(1)
    end
    # TODO 後でリダイレクト先をmentions/:theme_idに変更する
    it 'redirect to the new theme.' do
      #new_id = Theme.find(:all).size + 1
      post :create, :theme => @params
      #expect(response).to redirect_to '/mentions/'+new_id
      expect(response).to redirect_to themes_path
    end
  end

  context 'when error on save' do
    before do
      user_id = users(:user_01)
      @params = {:name => '', :description => 'dummy', :users => [user_id]}
    end
    it 'render new' do
      post :create, :theme => @params
      expect(response).to render_template 'themes/new'
    end
  end

  describe "GET '/themes' (index)" do

    before do
      get 'index'
    end

    it "リクエストは成功すること" do
      response.should be_success
    end

    it "テーマ一覧が取得できること" do
      get 'index'
      assigns[:themes].should have_at_least(1).themes
    end

    it "themes/index を描画すること" do
      response.should render_template 'themes/index'
    end
  end

  describe "GET 'themes/:id' (show)" do
    before do
      @theme = themes(:theme_01)
      get 'show', :id => @theme.id
    end

    it "レスポンスが成功すること" do
      response.should be_success
    end

    it "指定したIDのテーマが取得されていること" do
      assigns[:theme].should == @theme
    end

    it "themes/show を描画すること" do
      response.should render_template "themes/show"
    end
  end

  describe "GET 'themes/new (new)'" do

    before do
      get 'new'
    end

    it "レスポンスが成功すること" do
      response.should be_success
    end

    it "空のThemeがロードされること" do
      assigns[:theme] == Theme.new
    end

    it "themes/new を描画すること" do
      response.should render_template "themes/new"
    end

  end

  describe "GET 'themes/:id/edit" do
    before do
      @theme = themes(:theme_01)
      get 'edit', :id => @theme.id
    end

    it "レスポンスが成功すること" do
      response.should be_success
    end

    it "指定したIDのテーマが取得されていること" do
      assigns[:theme].should == @theme
    end

    it "themes/edit が描画されること" do
      response.should render_template "themes/edit"
    end
  end

  describe "POST 'themes'" do
    before do
    end

    it "レスポンスが成功すること" do
      response.should be_success
    end

    it "" do
    end


  end

  describe "PUT 'themes/:id'" do
    before do

    end

    it "レスポンスが成功すること" do
      response.should be_success
    end
  end

  describe "DELETE 'themes/:id'" do
    before do

    end

    it "レスポンスが成功すること" do
      response.should be_success
    end
  end
end
