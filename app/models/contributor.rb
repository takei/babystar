# Contributor's data model
class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :theme
  attr_accessible :theme_id, :user_id
end
