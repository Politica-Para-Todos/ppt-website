# frozen_string_literal: true

json.array! @parties do |party|
  json.acronym party.acronym
  json.logo party.logo
  json.name party.name
end
