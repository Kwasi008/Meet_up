FactoryBot.define do
  factory :role do
    user { FactoryBot.create :user }
    group { FactoryBot.create :group }
    role { %i[Organizer Presenter Participant].sample }
  end
end
