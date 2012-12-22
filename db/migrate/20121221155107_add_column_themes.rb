class AddColumnThemes < ActiveRecord::Migration
  def up
  	add_column :themes, :description, :string, :after => :name # :after doesn't work on sqlite.
  	Theme.reset_column_information
  	Theme.all.each do |theme|
  		theme.description = "This is description of %s. " % theme.name
  		theme.save
  	end
  end

  def down
  	remove_column :themes, :description
  end
end
