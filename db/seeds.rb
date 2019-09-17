# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.destroy_all
ManifestoItem.destroy_all
ManifestoSection.where.not(manifesto_section_id: nil).destroy_all
ManifestoSection.destroy_all
Manifesto.destroy_all
Party.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

p = Party.create(
  acronym: 'PPT',
  name: 'Politica para Todos'
)

3.times do |m_index|
  m = Manifesto.create(
    title: "Manifesto #{m_index}",
    party_id: p.id
  )

  for i in 1..rand(2..5) do
    s = ManifestoSection.create(
      manifesto_id: m.id,
      position: i,
      title: "Section #{i}"
    )

    for i in 1..rand(2..10) do
      ManifestoItem.create(
        manifesto_section_id: s.id,
        position: i,
        content: "texto e texto",
        item_type: "ParagraphManifestoItem"
      )
    end

    if rand() > 0.5
      i_s = ManifestoSection.create(
        manifesto_section_id: s.id,
        manifesto_id: m.id,
        position: 1,
        title: "Sub Section of #{s.id}"
      )

      for i in 1..rand(2..10) do
        ManifestoItem.create(
          manifesto_section_id: i_s.id,
          position: i,
          content: "texto e texto",
          item_type: "ParagraphManifestoItem"
        )
      end
    end
  end
end
