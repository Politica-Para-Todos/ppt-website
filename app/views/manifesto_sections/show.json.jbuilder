# frozen_string_literal: true

json.title @manifesto_section.title
json.manifesto_id @manifesto_section.manifesto_id

json.items @manifesto_items do |item|
  json.id item.id
  json.content item.content.html_safe
  json.item_type item.item_type
end
