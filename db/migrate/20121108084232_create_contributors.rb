class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.references :theme
      t.references :user

      t.timestamps
    end
    add_index :contributors, :theme_id
    add_index :contributors, :user_id
  end
end
