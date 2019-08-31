# frozen_string_literal: true

require 'test_helper'

class ManifestosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manifesto = manifestos(:one)
  end

  test 'should get index' do
    get manifestos_url
    assert_response :success
  end

  test 'should get new' do
    get new_manifesto_url
    assert_response :success
  end

  test 'should create manifesto' do
    assert_difference('Manifesto.count') do
      post manifestos_url, params: { manifesto: { title: @manifesto.title } }
    end

    assert_redirected_to manifesto_url(Manifesto.last)
  end

  test 'should show manifesto' do
    get manifesto_url(@manifesto)
    assert_response :success
  end

  test 'should get edit' do
    get edit_manifesto_url(@manifesto)
    assert_response :success
  end

  test 'should update manifesto' do
    patch manifesto_url(@manifesto), params: { manifesto: { title: @manifesto.title } }
    assert_redirected_to manifesto_url(@manifesto)
  end

  test 'should destroy manifesto' do
    assert_difference('Manifesto.count', -1) do
      delete manifesto_url(@manifesto)
    end

    assert_redirected_to manifestos_url
  end
end
