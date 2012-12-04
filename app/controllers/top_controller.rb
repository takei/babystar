class TopController < ApplicationController

  ##　初期表示用
  def indexBt
    initialThemeId = 1
    defineVariablesForIndex initialThemeId
  end

  def showBt
    defineVariablesForIndex params[:theme_id]
  end

private
  def defineVariablesForIndex(themeId)
    @themes = Theme.all
    return render :template => 'themes/new_bt' if @themes.size == 0
    @theme = Theme.find(themeId)
    @attenders = @theme.users
    @users = User.all
    @mentions = @theme.mentions
    @mention = Mention.new
    render :template => 'top/index_bt'
  end

end
