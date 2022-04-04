class Role < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :role, presence: true
  after_initialize :set_defaults

  enum role: [:Organizer, :Presenter, :Participant]

  private

  def set_defaults
    if self.new_record?
      self.role ||= :Participant
    end
  end

end
