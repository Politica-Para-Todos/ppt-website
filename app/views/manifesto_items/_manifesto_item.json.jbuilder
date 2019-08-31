# frozen_string_literal: true

json.extract! manifesto_item, :id, :manifesto_section_id, :kind, :position, :text, :created_at, :updated_at
json.url manifesto_item_url(manifesto_item, format: :json)
