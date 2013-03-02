class ThemesController < ApplicationController
  def new
    @theme = Theme.new
    @users = User.all
    render
  end

  def create
    @theme = Theme.new(:name => params[:theme][:name], :description => params[:theme][:description])
    @theme.users = make_user_list(params[:theme][:users])
    if @theme.save
      redirect_to "/mentions/" + @theme.id.to_s
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
    @attenders = @theme.users
    @attender_ids = []
    @attenders.each do |attender|
      @attender_ids << attender.id
    end
    (@attender_ids.size() == 0) ? @attender_ids << 0 : @attender_ids
    @users = User.where( "id NOT IN (?)", @attender_ids )
    render 
  end

  # PUT /themes/1
  def update
    @theme = Theme.find(params[:id])
    @theme.name = params[:theme][:name]
    @theme.description = params[:theme][:description]
    users = make_user_list(params[:theme][:users])
    @theme.users.replace(users);
    if @theme.save
      redirect_to themes_path
    else
      render action: "edit"
    end
  end

private
  def make_user_list(ids)
    ids.map { |user_id|
      next if (user_id.empty?)
      User.find(user_id)
    }.compact
  end

end
