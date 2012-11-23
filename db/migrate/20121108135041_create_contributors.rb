class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :theme_id
      t.integer :user_id

      t.timestamps
    end
  end
end
