# User's data model
class User < ActiveRecord::Base
  has_many :themes, :through => :contributors
  has_many :contributors
  has_many :mentions
  attr_accessible :email, :name
end
