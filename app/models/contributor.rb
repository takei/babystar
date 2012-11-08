class Contributor < ActiveRecord::Base
  belongs_to :theme
  belongs_to :user
  # attr_accessible :title, :body
end
