# frozen_string_literal: true

FactoryBot.define do
  factory :manifesto_section do
    kind { 'section' }
    position { 0 }
    content { '1. Hello manifesto section' }
    version { 1 }

    manifesto
  end
end
