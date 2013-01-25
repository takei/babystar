# Flay 実行タスク
# Flay : 重複部分を発見するツール

require "rake/tasklib"
require "flay"
require "flay_task"

FlayTask.new do | t |
  # 必要に応じてチェック対象のディレクトリを追加する
  t.dirs = %w( lib )
  t.threshold = 0
end
