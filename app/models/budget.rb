class Budget < ActiveRecord::Base
  belongs_to :user

  validates :limit, presence: true


end