# Roodi 実行タスク
# Roodi:リファクタリング可能箇所検出ツール(Reekとは別指標)
require "rake/tasklib"
require "roodi"
require "roodi_task"

RoodiTask.new do | t |
  t.patterns = %w(app/**/*.rb)
end
