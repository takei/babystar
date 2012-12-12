class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.string :content
      t.string :mentionedAt
      t.integer :theme_id
      t.integer :user_id

      t.timestamps
    end
  end
end
