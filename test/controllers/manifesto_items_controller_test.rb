# frozen_string_literal: true

require 'test_helper'

class ManifestoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manifesto_item = manifesto_items(:one)
  end

  test 'should get index' do
    get manifesto_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_manifesto_item_url
    assert_response :success
  end

  test 'should create manifesto_item' do
    assert_difference('ManifestoItem.count') do
      post manifesto_items_url, params: { manifesto_item: { kind: @manifesto_item.kind, manifesto_section_id: @manifesto_item.manifesto_section_id, position: @manifesto_item.position, text: @manifesto_item.text } }
    end

    assert_redirected_to manifesto_item_url(ManifestoItem.last)
  end

  test 'should show manifesto_item' do
    get manifesto_item_url(@manifesto_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_manifesto_item_url(@manifesto_item)
    assert_response :success
  end

  test 'should update manifesto_item' do
    patch manifesto_item_url(@manifesto_item), params: { manifesto_item: { kind: @manifesto_item.kind, manifesto_section_id: @manifesto_item.manifesto_section_id, position: @manifesto_item.position, text: @manifesto_item.text } }
    assert_redirected_to manifesto_item_url(@manifesto_item)
  end

  test 'should destroy manifesto_item' do
    assert_difference('ManifestoItem.count', -1) do
      delete manifesto_item_url(@manifesto_item)
    end

    assert_redirected_to manifesto_items_url
  end
end
