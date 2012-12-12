class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :email, :name
  has_and_belongs_to_many :themes
=======
  has_many :themes, :through => :contributors
  has_many :contributors
  has_many :mentions
  attr_accessible :email, :name
>>>>>>> bf09b4d3de7925d50c38c0b4b99cced51a7bc0a0
end
