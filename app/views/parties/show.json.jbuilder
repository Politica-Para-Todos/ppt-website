# frozen_string_literal: true

json.acronym @party.acronym
json.logo @party.logo
json.name @party.name
json.description @party.description
json.description_source @party.description_source
json.website @party.website

json.socialMedia do
  json.array! [
    {'type': 'email', 'url': @party.email},
    {'type': 'facebook', 'url': @party.facebook},
    {'type': 'twitter', 'url': @party.twitter},
    {'type': 'instagram', 'url': @party.instagram}
  ]
end

json.candidates @candidates do |candidate|
  json.name candidate.name
  json.circle do
    json.id candidate.district.downcase.gsub(' ', '-').gsub('ç', 'c').gsub('é', 'e').gsub('ú', 'u')
    json.name candidate.district
  end
  json.photo candidate.photo
end
