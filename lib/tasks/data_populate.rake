# frozen_string_literal: true

require 'json'
require 'open-uri'

namespace :data do
  task :populate, [:json_path] => :environment do |_t, args|
    json_path = args[:json_path] || './db/seeds.json'

    json_file = open(json_path)

    JSON.parse(json_file.read).each do |party_acronym, party|
      p = Party.find_or_initialize_by(acronym: party_acronym)

      p.description = party.fetch('description')
      p.description_source = party.fetch('description_source')
      p.email = party.fetch('email')
      p.facebook = party.fetch('facebook')
      p.instagram = party.fetch('instagram')
      p.twitter = party.fetch('twitter')
      p.website = party.fetch('website')
      p.logo = party.fetch('logo')
      p.name = party.fetch('name')

      puts "Party #{p.acronym} updated!" if p.save

      party.fetch('candidates', []).each do |district, candidate_types|
        candidate_types.each do |candidate_type, candidates|
          candidates.each do |candidate|
            c = Candidate.find_or_initialize_by(
              party_id: p.id,
              district: district,
              position: candidate.fetch('position')
            )

            c.name = candidate.fetch('name')
            c.biography = candidate.fetch('biography', nil)
            c.biography_source = candidate.fetch('biography_source', nil)
            c.is_lead_candidate = candidate.fetch('is_lead_candidate')
            c.link_parlamento = candidate.fetch('link_parlamento', nil)
            c.photo = candidate.fetch('photo', nil)
            c.photo_source = candidate.fetch('photo_source', nil)
            c.candidate_type = candidate.fetch('type')

            puts "Candidate #{c.name} updated!" if c.save
          end
        end
      end
    end
  end
end
