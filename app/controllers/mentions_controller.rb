class MentionsController < ApplicationController

  def show
    @theme = Theme.find(params[:theme_id])
    @mention = Mention.new

    render :action => 'show'
  end

  # GET /mentions/new
  # GET /mentions/new.json
  def new
    @mention = Mention.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mention }
    end
  end

  # POST /mentions
  # POST /mentions.json
  def create
    @mention = Mention.new(params[:mention])
    @mention.mentionedAt = Time.now
    
    if @mention.save
        redirect_to :action => 'show', :id => @mention.theme.id
    else
    end
  end

  # DELETE /mentions/1
  # DELETE /mentions/1.json
  def destroy
    @mention = Mention.find(params[:id])
    @mention.destroy

    respond_to do |format|
      format.html { redirect_to mentions_url }
      format.json { head :no_content }
    end
  end
end
