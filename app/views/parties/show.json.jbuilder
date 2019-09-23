# frozen_string_literal: true

json.acronym @party.acronym
json.logo @party.logo
json.name @party.name
json.description @party.description
json.website @party.website
json.email @party.email
json.description_source @party.description_source
json.facebook @party.facebook
json.twitter @party.twitter
json.instagram @party.instagram

json.candidates @candidates do |candidate|
  json.name candidate.name
  json.district candidate.district
  json.photo candidate.photo
end
