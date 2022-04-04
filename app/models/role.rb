class Role < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum role: [:Organizer, :Presenter, :Participant]
end
