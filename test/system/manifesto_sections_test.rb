# frozen_string_literal: true

require 'application_system_test_case'

class ManifestoSectionsTest < ApplicationSystemTestCase
  setup do
    @manifesto_section = manifesto_sections(:one)
  end

  test 'visiting the index' do
    visit manifesto_sections_url
    assert_selector 'h1', text: 'Manifesto Sections'
  end

  test 'creating a Manifesto section' do
    visit manifesto_sections_url
    click_on 'New Manifesto Section'

    fill_in 'Kind', with: @manifesto_section.kind
    fill_in 'Manifesto', with: @manifesto_section.manifesto_id
    fill_in 'Manifesto section', with: @manifesto_section.manifesto_section_id
    fill_in 'Position', with: @manifesto_section.position
    fill_in 'Text', with: @manifesto_section.text
    click_on 'Create Manifesto section'

    assert_text 'Manifesto section was successfully created'
    click_on 'Back'
  end

  test 'updating a Manifesto section' do
    visit manifesto_sections_url
    click_on 'Edit', match: :first

    fill_in 'Kind', with: @manifesto_section.kind
    fill_in 'Manifesto', with: @manifesto_section.manifesto_id
    fill_in 'Manifesto section', with: @manifesto_section.manifesto_section_id
    fill_in 'Position', with: @manifesto_section.position
    fill_in 'Text', with: @manifesto_section.text
    click_on 'Update Manifesto section'

    assert_text 'Manifesto section was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Manifesto section' do
    visit manifesto_sections_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Manifesto section was successfully destroyed'
  end
end
