class ThemesController < ApplicationController
  def new
    @theme = Theme.new
    @users = User.all
    render
  end

  def create
    @theme = Theme.new(:name => params[:theme][:name], :description => params[:theme][:description])

    users = []
    params[:theme][:users].each {|user_id| 
      next if (user_id.empty?)
      user = User.find(user_id)
      users << user
    }
    @theme.users = users

    if @theme.save
      redirect_to themes_path
    else
      render action: "new"
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to themes_path
  end

  # GET /themes
  # GET /themes.json
  def index
    @themes = Theme.all
    render
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

  # GET /themes/1/edit
  def edit
    @theme = Theme.find(params[:id])

    # @theme = Theme.find(params[:theme_id])
    @attenders = @theme.users
    @attender_ids = []
    @attenders.each do |attender|
      @attender_ids << attender.id
    end
    (@attender_ids.size() == 0) ? @attender_ids << 0 : @attender_ids
    @users = User.where( "id NOT IN (?)", @attender_ids )
    render 
  end

  # POST /themes
  # POST /themes.json
  # def create
  #   @theme = Theme.new(params[:theme])
  #   respond_to do |format|
  #     if @theme.save
  #       format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
  #       format.json { render json: @theme, status: :created, location: @theme }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @theme.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  # def destroy
  #   @theme = Theme.find(params[:id])
  #   @theme.destroy

  #   respond_to do |format|
  #     format.html { redirect_to themes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
