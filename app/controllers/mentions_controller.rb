class MentionsController < ApplicationController


  # GET /mentions/[:theme_id]
  # テーマに対応した発言一覧を返します。
  def show
    @theme = Theme.find(params[:theme_id])
    @mention = Mention.new

    render :action => 'show'
  end

  # POST /mentions
  # 新規の発言を作成します。
  def create
    @mention = Mention.new(params[:mention])
    @mention.mentioned_at = Time.now

    if @mention.save
        redirect_to :action => 'show', :theme_id => @mention.theme.id
    else

    end
  end

  # DELETE /mentions/[:id]
  # 指定したIDに対応する発言を削除します。
  def destroy
    @mention = Mention.find(params[:id])
    @mention.destroy
    redirect_to :action => 'show', :theme_id => @mention.theme.id
  end
end
