require 'test_helper'

class PercorsosControllerTest < ActionController::TestCase
  setup do
    @percorso = percorsos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:percorsos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create percorso" do
    assert_difference('Percorso.count') do
      post :create, percorso: { data: @percorso.data, destinazione: @percorso.destinazione, durata: @percorso.durata, ora: @percorso.ora, partenza: @percorso.partenza, utref: @percorso.utref }
    end

    assert_redirected_to percorso_path(assigns(:percorso))
  end

  test "should show percorso" do
    get :show, id: @percorso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @percorso
    assert_response :success
  end

  test "should update percorso" do
    patch :update, id: @percorso, percorso: { data: @percorso.data, destinazione: @percorso.destinazione, durata: @percorso.durata, ora: @percorso.ora, partenza: @percorso.partenza, utref: @percorso.utref }
    assert_redirected_to percorso_path(assigns(:percorso))
  end

  test "should destroy percorso" do
    assert_difference('Percorso.count', -1) do
      delete :destroy, id: @percorso
    end

    assert_redirected_to percorsos_path
  end
end
