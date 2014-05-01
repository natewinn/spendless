class User < ActiveRecord::Base
  has_many :accounts
  has_many :transactions
  has_one :budget


end