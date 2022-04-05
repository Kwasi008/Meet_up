class Group < ApplicationRecord
  require 'csv'
  has_many :roles
  has_many :users, through: :roles
  validates :name, presence: true


  def self.import(file)

		CSV.foreach(file.path, headers: true, :header_converters => :symbol) do |row|
			hash = row.to_hash
			transaction do
				user = User.find_by(last_name: hash[:last_name])
				if user.nil?
					user = User.new(first_name: hash[:first_name], last_name: hash[:last_name])
					user.save!
				end
				group = Group.find_by(name: hash[:group_name])
				if group.nil?
					group = Group.new(name: hash[:group_name])
					group.save!
				end
				role = Role.where("group_id = ? AND user_id = ?", group.id, user.id)
				if role.count == 0
					Role.new(role: hash[:role_in_group], user_id: user.id, group_id: group.id).save!
				end
			end
		end
	end

end
