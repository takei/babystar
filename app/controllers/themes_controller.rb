class ThemesController < ApplicationController
<<<<<<< HEAD
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
=======
  def newBt
    @theme = Theme.new
    @users = User.all
    render :template => 'themes/new_bt'
  end

  # GET /themes
  # GET /themes.json
  def index
    @themes = Theme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @themes }
    end
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
    @theme = Theme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theme }
    end
  end

  # GET /themes/new
  # GET /themes/new.json
  def new
    @theme = Theme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theme }
    end
  end

  # GET /themes/1/edit
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
  def edit
    @theme = Theme.find(params[:id])
  end

  # POST /themes
<<<<<<< HEAD
  def create
    @theme = set_attributes(Theme.new, params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.'}
      else
        format.html {render action: "new"}
=======
  # POST /themes.json
  def create
    @theme = Theme.new(params[:theme])

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render json: @theme, status: :created, location: @theme }
      else
        format.html { render action: "new" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
      end
    end
  end

<<<<<<< HEAD
  # PUT /themes/:id
  def update
    @theme = set_attributes(Theme.find(params[:id]), params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.'}
      else
        format.html { render action: "edit" }
=======
  # PUT /themes/1
  # PUT /themes/1.json
  def update
    @theme = Theme.find(params[:id])

    respond_to do |format|
      if @theme.update_attributes(params[:theme])
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
      end
    end
  end

<<<<<<< HEAD
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
=======
  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

    respond_to do |format|
      format.html { redirect_to themes_url }
      format.json { head :no_content }
    end
  end
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
end
