# Controller handling initial view
class TopController < ApplicationController

  # 初期表示用
  def index
    define_variables Theme.find(:first)
  end

  # 二回目以降の表示用
  def show
    define_variables params[:theme_id]
  end

private
  # 表示時に必要な値取得
  def define_variables(theme_id)
    @themes = Theme.all
    return redirect_to :controller => 'themes', :action => 'new' if @themes.size == 0
    @theme = Theme.find(theme_id)
    @attenders = @theme.users
    @users = User.all
    @mentions = @theme.mentions
    @mention = Mention.new
    render :template => 'top/index'
  end

end
