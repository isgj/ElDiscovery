require 'test_helper'

class PartecipantisControllerTest < ActionController::TestCase
  setup do
    @partecipanti = partecipantis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partecipantis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partecipanti" do
    assert_difference('Partecipanti.count') do
      post :create, partecipanti: { percorso: @partecipanti.percorso, utente: @partecipanti.utente }
    end

    assert_redirected_to partecipanti_path(assigns(:partecipanti))
  end

  test "should show partecipanti" do
    get :show, id: @partecipanti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partecipanti
    assert_response :success
  end

  test "should update partecipanti" do
    patch :update, id: @partecipanti, partecipanti: { percorso: @partecipanti.percorso, utente: @partecipanti.utente }
    assert_redirected_to partecipanti_path(assigns(:partecipanti))
  end

  test "should destroy partecipanti" do
    assert_difference('Partecipanti.count', -1) do
      delete :destroy, id: @partecipanti
    end

    assert_redirected_to partecipantis_path
  end
end
