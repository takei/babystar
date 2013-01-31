# Flog 実行タスク
# Flog : 複雑すぎる部分を発見するツール
require "rake/tasklib"
require "flog"

desc "Analyze for code complexity"
task :flog do
  flog = Flog.new
  flog.flog [ "app" ]
  threshold = 10

  bad_methods = flog.totals.select do | name, score |
    name != "main#none" && score > threshold
  end
  bad_methods.sort do | a, b |
    a[ 1 ]  <=> b[ 1 ]
  end.each do | name, score |
    puts "%8.1f: %s" % [ score, name ]
  end
  unless bad_methods.empty?
    raise "#{ bad_methods.size } methods have a flog complexity > #{ threshold }"
  end
end
