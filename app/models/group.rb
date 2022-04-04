class Group < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles
  validates :name, presence: true
end
