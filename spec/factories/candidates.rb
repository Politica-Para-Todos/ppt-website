FactoryBot.define do
  factory :candidate do
    name { "MyString" }
    district { "MyString" }
    photo { "MyString" }
    description { "MyText" }
    description_source { "MyString" }
    isLeadCandidate { false }
    candidateType { "MyString" }
  end
end
