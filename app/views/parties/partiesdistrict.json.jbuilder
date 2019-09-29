# frozen_string_literal: true

json.array! @parties do |party|
  json.acronym party.acronym
  json.logo party.logo
  json.title party.name
end


#json.candidates @candidates do |candidate|
#  json.name candidate.name
#  json.circle do
#    json.id candidate.district.downcase.gsub(' ', '-').gsub('ç', 'c').gsub('é', 'e').gsub('ú', 'u')
#    json.name candidate.district
#  end
#  json.photo candidate.photo
#end