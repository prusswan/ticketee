FactoryGirl.define do
  factory :ticket do
    title "A ticket"
    description "A ticket, nothing more"
    user { |u| u.association(:user) }
    project { |p| p.association(:project) }
  end
end
