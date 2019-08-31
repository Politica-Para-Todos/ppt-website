require "application_system_test_case"

class ManifestoItemsTest < ApplicationSystemTestCase
  setup do
    @manifesto_item = manifesto_items(:one)
  end

  test "visiting the index" do
    visit manifesto_items_url
    assert_selector "h1", text: "Manifesto Items"
  end

  test "creating a Manifesto item" do
    visit manifesto_items_url
    click_on "New Manifesto Item"

    fill_in "Kind", with: @manifesto_item.kind
    fill_in "Manifesto section", with: @manifesto_item.manifesto_section_id
    fill_in "Position", with: @manifesto_item.position
    fill_in "Text", with: @manifesto_item.text
    click_on "Create Manifesto item"

    assert_text "Manifesto item was successfully created"
    click_on "Back"
  end

  test "updating a Manifesto item" do
    visit manifesto_items_url
    click_on "Edit", match: :first

    fill_in "Kind", with: @manifesto_item.kind
    fill_in "Manifesto section", with: @manifesto_item.manifesto_section_id
    fill_in "Position", with: @manifesto_item.position
    fill_in "Text", with: @manifesto_item.text
    click_on "Update Manifesto item"

    assert_text "Manifesto item was successfully updated"
    click_on "Back"
  end

  test "destroying a Manifesto item" do
    visit manifesto_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manifesto item was successfully destroyed"
  end
end
