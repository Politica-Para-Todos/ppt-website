# frozen_string_literal: true

require 'test_helper'

class ManifestoSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manifesto_section = manifesto_sections(:one)
  end

  test 'should get index' do
    get manifesto_sections_url
    assert_response :success
  end

  test 'should get new' do
    get new_manifesto_section_url
    assert_response :success
  end

  test 'should create manifesto_section' do
    assert_difference('ManifestoSection.count') do
      post manifesto_sections_url, params: { manifesto_section: { kind: @manifesto_section.kind, manifesto_id: @manifesto_section.manifesto_id, manifesto_section_id: @manifesto_section.manifesto_section_id, position: @manifesto_section.position, text: @manifesto_section.text } }
    end

    assert_redirected_to manifesto_section_url(ManifestoSection.last)
  end

  test 'should show manifesto_section' do
    get manifesto_section_url(@manifesto_section)
    assert_response :success
  end

  test 'should get edit' do
    get edit_manifesto_section_url(@manifesto_section)
    assert_response :success
  end

  test 'should update manifesto_section' do
    patch manifesto_section_url(@manifesto_section), params: { manifesto_section: { kind: @manifesto_section.kind, manifesto_id: @manifesto_section.manifesto_id, manifesto_section_id: @manifesto_section.manifesto_section_id, position: @manifesto_section.position, text: @manifesto_section.text } }
    assert_redirected_to manifesto_section_url(@manifesto_section)
  end

  test 'should destroy manifesto_section' do
    assert_difference('ManifestoSection.count', -1) do
      delete manifesto_section_url(@manifesto_section)
    end

    assert_redirected_to manifesto_sections_url
  end
end
