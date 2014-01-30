class User < ActiveRecord::Base
  has_secure_password
  has_many :articles

  validates_presence_of :password, :on => :create
  validates_presence_of :name
end
