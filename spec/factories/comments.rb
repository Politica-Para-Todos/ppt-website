FactoryBot.define do
  factory :comment do
    manifesto_item { nil }
    user { nil }
    content { "MyText" }
    hidden { false }
  end
end
