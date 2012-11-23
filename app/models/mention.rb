class Mention < ActiveRecord::Base
  belongs_to :theme
  belongs_to :user
  attr_accessible :content, :mentionedAt, :theme_id, :user_id
end
