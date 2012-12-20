class Theme < ActiveRecord::Base
  has_many :mentions
  has_many :users, :through => :contributors
  has_many :contributors
  attr_accessible :name
  validates :name, :presence => true
end
