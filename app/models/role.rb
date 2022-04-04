class Role < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :role, presence: true
  after_initialize :set_defaults

  enum role: %i[Organizer Presenter Participant]

  private

  def set_defaults
    self.role ||= :Participant if new_record?
  end
end
