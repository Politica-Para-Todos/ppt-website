# frozen_string_literal: true

json.title @manifesto_section.content

json.items @manifesto_section.manifesto_items.printable(@manifesto_section.version) do |item|
  json.id item.digest
  json.content item.render.html_safe
  json.comments_count item.comments_count
end
