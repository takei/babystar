class ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end
  def list
    @themes = Theme.all
  end
  def create
    @theme = Theme.new(params[:theme])
    @theme.users = params[:users].map{|user|User.find(user)}
    @theme.save
  end
end
