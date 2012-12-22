class Theme < ActiveRecord::Base
  has_many :mentions
  has_many :users, :through => :contributors
  has_many :contributors
  attr_accessible :name, :users, :description
  validates :name, :presence => true
end
