class Mention < ActiveRecord::Base
  belongs_to :theme
  belongs_to :user
  attr_accessible :content, :mentioned_at, :theme_id, :user_id
end
