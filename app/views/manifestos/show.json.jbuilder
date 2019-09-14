# frozen_string_literal: true

json.(@manifesto, :title)

json.sections @manifesto_sections do |section|
  json.id section.id
  json.title section.title
  #json.position section.position
  json.subsections ManifestoSection.where(manifesto_section_id: section.id).sort_by { |section| section.position } do |subsection|
    json.id subsection.id
    json.title subsection.title
    #json.position subsection.position
  end
end
