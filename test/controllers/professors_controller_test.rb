require 'test_helper'

class ProfessorsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @professor = professors(:James)
    @flag = @professor.flag
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professor" do
    assert_difference('Professor.count') do
      post :create, professor: { department: @professor.department, fullname: @professor.fullname, school: @professor.school }
    end
    assert_redirected_to professor_path(assigns(:professor))
  end

  test "should show professor" do
    get :show, id: @professor.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professor
    assert_response :success
  end

  test "should update professor" do
    patch :update, id: @professor, professor: { department: @professor.department, fullame: @professor.fullname, school: @professor.school }
    assert_redirected_to professor_path(assigns(:professor))
  end

  test "should destroy professor" do
    assert_difference('Professor.count', -1) do
      delete :destroy, id: @professor
    end
    assert_redirected_to professors_path
  end

  test "should flag professor" do
    update :flag_professor, id: @professor
    assert_difference(@flag.count, 1) do
    end
    assert_response :success
  end
end
