# frozen_string_literal: true

require 'application_system_test_case'

class ManifestosTest < ApplicationSystemTestCase
  setup do
    @manifesto = manifestos(:one)
  end

  test 'visiting the index' do
    visit manifestos_url
    assert_selector 'h1', text: 'Manifestos'
  end

  test 'creating a Manifesto' do
    visit manifestos_url
    click_on 'New Manifesto'

    fill_in 'Title', with: @manifesto.title
    click_on 'Create Manifesto'

    assert_text 'Manifesto was successfully created'
    click_on 'Back'
  end

  test 'updating a Manifesto' do
    visit manifestos_url
    click_on 'Edit', match: :first

    fill_in 'Title', with: @manifesto.title
    click_on 'Update Manifesto'

    assert_text 'Manifesto was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Manifesto' do
    visit manifestos_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Manifesto was successfully destroyed'
  end
end
