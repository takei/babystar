class ThemesUsers < ActiveRecord::Migration
  def change
    create_table :themes_users, :id => false do |t|
      t.references :theme
      t.references :user
    end
  end
end
