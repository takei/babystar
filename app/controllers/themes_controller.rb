class ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end

  def index
    @themes = Theme.all
  end

  def create
    @theme = Theme.new(params[:theme])
    @theme.users = params[:users].map{|user|User.find(user)}

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.'}
      else
        format.html {render action: "new"}
      end
    end
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    respond_to do |format|
      format.html {redirect_to themes_url}
    end
  end
end
