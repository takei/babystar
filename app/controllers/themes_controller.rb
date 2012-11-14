class ThemesController < ApplicationController
  # GET /themes
  def index
    @themes = Theme.all
  end

  # GET /themes/:id
  def show
    @theme = Theme.find(params[:id])
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/:id/edit
  def edit
    @theme = Theme.find(params[:id])
  end

  # POST /themes
  def create
    @theme = set_attributes(Theme.new, params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.'}
      else
        format.html {render action: "new"}
      end
    end
  end

  # PUT /themes/:id
  def update
    @theme = set_attributes(Theme.find(params[:id]), params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.'}
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /themes/:id
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    respond_to do |format|
      format.html {redirect_to themes_url}
    end
  end

  private
  def set_attributes(theme, params)
    theme.attributes = params[:theme]
    theme.users = params[:users].map{|user|User.find(user)}
    return theme
  end
end
