class ChangeMentionedAtColumnName < ActiveRecord::Migration
  def change
	rename_column :mentions, :mentionedAt, :mentioned_at
  end
end
