class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create

  has_many :accounts
  has_many :transactions, through: :accounts
  has_one :budget

end