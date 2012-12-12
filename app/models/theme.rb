class Theme < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name, :users
  has_and_belongs_to_many :users

  validates :name,
    :presence => true,
    :uniqueness => true
=======
  has_many :mentions
  has_many :users, :through => :contributors
  has_many :contributors
  attr_accessible :name
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
end
