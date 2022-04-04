class User < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :groups, through: :roles
  validates :first_name, presence: true
	validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
