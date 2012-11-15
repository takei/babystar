class Theme < ActiveRecord::Base
  attr_accessible :name, :users
  has_and_belongs_to_many :users

  validates :name,
    :presence => true,
    :uniqueness => true
end
