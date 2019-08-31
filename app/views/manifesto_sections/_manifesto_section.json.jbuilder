# frozen_string_literal: true

json.extract! manifesto_section, :id, :manifesto_id, :manifesto_section_id, :kind, :position, :text, :created_at, :updated_at
json.url manifesto_section_url(manifesto_section, format: :json)
