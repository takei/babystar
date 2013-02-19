class ChangeMentionedAtColumnType < ActiveRecord::Migration
  def change
  	change_column :mentions, :mentioned_at, :timestamp
  end
end
