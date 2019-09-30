# frozen_string_literal: true

json.acronym @party.acronym
json.logo @party.logo
json.name @party.name
json.website @party.website
json.hasManifesto @party.manifestos.length > 0

json.socialMedia do
  json.array! [
    {'type': 'email', 'url': @party.email},
    {'type': 'facebook', 'url': @party.facebook},
    {'type': 'twitter', 'url': @party.twitter},
    {'type': 'instagram', 'url': @party.instagram}
  ]
end

json.leadCandidate do
  json.name @lead_candidate.name
  json.biography @lead_candidate.biography
  json.biography_source @lead_candidate.biography_source
  json.link_parlamento @lead_candidate.link_parlamento
  json.photo @lead_candidate.photo
  json.photo_source @lead_candidate.photo_source
  json.responsibility "Cabeça de lista"
end

json.candidates @candidates do |candidate|
  json.name candidate.name
  json.type candidate.candidate_type
  json.position candidate.position
end
