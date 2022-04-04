FactoryBot.define do
  factory :role do
    user {FactoryBot.create :user }
    group {FactoryBot.create :group }
    role {[:Organizer, :Presenter, :Participant].sample}
  end
end
