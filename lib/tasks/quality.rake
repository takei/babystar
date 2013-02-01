# メトリクスチェック系のタスクを一括でやるタスク

desc "Enforce Ruby code quality with static analysis of code"
task :quality => [ :reek, :roodi]
#task :quality => [ :reek, :roodi, :flog, :flay ]
