require 'test_helper'

class UtentesControllerTest < ActionController::TestCase
  setup do
    @utente = utentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:utentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create utente" do
    assert_difference('Utente.count') do
      post :create, utente: { email: @utente.email, età: @utente.età, idg: @utente.idg, nome: @utente.nome, sesso: @utente.sesso }
    end

    assert_redirected_to utente_path(assigns(:utente))
  end

  test "should show utente" do
    get :show, id: @utente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @utente
    assert_response :success
  end

  test "should update utente" do
    patch :update, id: @utente, utente: { email: @utente.email, età: @utente.età, idg: @utente.idg, nome: @utente.nome, sesso: @utente.sesso }
    assert_redirected_to utente_path(assigns(:utente))
  end

  test "should destroy utente" do
    assert_difference('Utente.count', -1) do
      delete :destroy, id: @utente
    end

    assert_redirected_to utentes_path
  end
end
