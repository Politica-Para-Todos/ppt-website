# frozen_string_literal: true


namespace :data do
  task :clean => :environment do

    ManifestoItem.delete_all
    ManifestoSection.where.not(manifesto_section_id: nil).delete_all
    ManifestoSection.delete_all
    Manifesto.delete_all
    Candidate.delete_all
    Party.delete_all

    puts "Done!"
  end
end
