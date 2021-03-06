# coding: utf-8
require 'spec_helper'

describe Theme do
  it 'should have description' do
    expected = 'dummy description'
    theme = Theme.new(:description => expected)
    expect(theme.description).to eq(expected)
  end
end

describe Theme do
  fixtures :themes, :users, :contributors, :mentions
  before do
    @theme = themes(:theme_01)
  end

  it "テーマには複数のユーザが所属していること" do
    @theme.should have_at_least(2).users
  end

  it "テーマには複数の発言があること" do
    @theme.should have_at_least(2).mentions
  end
end

describe Theme, "にユーザを追加できた場合" do
  fixtures :themes, :users
  before do
    @theme = themes(:theme_01)
  end

  it "ユーザの数が１増えること" do
    lambda {
      @theme.users.create(
        :name => '',
        :email => ''
      )
    }.should change(User, :count).by(1)
  end
end

describe Theme, "name が設定されていない場合"do
  before(:each) do
    @theme = Theme.new
  end

  it "バリデーションに失敗すること" do
    @theme.should_not be_valid
  end

  it ":nameにエラーが設定されていること" do
    @theme.should have(1).errors_on(:name)
  end
end