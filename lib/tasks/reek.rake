# Reek実行タスク
# Reek:リファクタリング可能箇所検出ツール
require "reek/rake/task"

Reek::Rake::Task.new do | t |
  t.fail_on_error = false
  t.verbose = false
  t.reek_opts = "--quiet"
  t.source_files = "app/**/*.rb"
end
