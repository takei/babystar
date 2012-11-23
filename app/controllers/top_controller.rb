class TopController < ApplicationController

  ##　初期表示用
  def indexBt
    @themes = Theme.all
    @theme = Theme.find(1)
    @attenders = @theme.users
    @users = User.all
    @mentions = @theme.mentions
    @mention = Mention.new
    render :template => 'top/index_bt'
  end

  def showBt
    @themes = Theme.all
    @theme = Theme.find(params[:top_id])
    @attenders = @theme.users
    @users = User.all
    @mentions = @theme.mentions
    @mention = Mention.new
    render :template => 'top/index_bt'
  end

  ##　初期表示用
  def index
    ## ２つのモデルをレスポンスで返す例
    @themes = Theme.all
    #発言は不要だが、モデルがないと怒られるのでnilにしておく
    @mentions = nil#Mention.all
    @contributors = nil#Mention.all
    ## 画面遷移①：renderを使った画面遷移（一般的らしい）
    render :template => 'top/index'
    ##　画面遷移②：respond_toを使った画面遷移（）
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @themes }
    #end
  end
  
  ##　検索用
  def search
    
    ##リクエストから選択されたテーマIDを受け取る
    session[:theme_id] = params[:themeIdSelect]

    @mentions = Mention.new(params[:mention])
    
    ## ２つのモデルをレスポンスで返す例
    #http://d.hatena.ne.jp/nakakoh/20080510/1210390013
    refresh(session[:theme_id] )
    render :template => 'top/index'
  end
  
  ##　発言用
  def create
    ##①発言の登録
    #mention生成
    @mention = Mention.new()
    #発言者取得
    @mention.user_id = params[:contributor]
    #テーマID取得
    session[:theme_id] = params[:targettheme]
    @mention.theme_id = params[:targettheme]
    #現在日時取得
    strTime = Time.now
    #strTime = strDay = t.strftime("現在日時 %B,%d(%A) %Y %Z")
    @mention.mentionedAt = strTime
    @mention.content = params[:content]
    #DB登録
    @mention.save

    ##②再表示用
    refresh(params[:targettheme])
    ##③自画面遷移
    render :template => 'top/index'
  end

  def refresh(theme_id)
    ##再表示用
    @themes = Theme.all
    @theme = Theme.where(:id => 1).first
    print @theme.users.length
    ##1行検索
    #①主キー検索　NG
    #@mentions = Mention.find(1)
    #②find_by_カラム名　NG
    #@mentions = Mention.find_by_id("1")
    #③SQL指定　OK
    selectMentions = "SELECT * from Mentions WHERE theme_id = " + theme_id
    @mentions = Mention.find_by_sql(selectMentions)

    ##プルダウン用
    selectContributors = "SELECT * from Contributors WHERE theme_id = " + theme_id
    @contributors = Contributor.find_by_sql(selectContributors)

    #@contributorArr = Array.new()
    #for contributor in contributors
    #  @contributorArr.append(contributor.id)
    #end
  end
end
