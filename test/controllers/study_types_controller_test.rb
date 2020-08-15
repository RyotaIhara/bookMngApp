require 'test_helper'

class StudyTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_type = study_types(:one)
  end

  test "should get index" do
    get study_types_url
    assert_response :success
  end

  test "should get new" do
    get new_study_type_url
    assert_response :success
  end

  test "should create study_type" do
    assert_difference('StudyType.count') do
      post study_types_url, params: { study_type: {  } }
    end

    assert_redirected_to study_type_url(StudyType.last)
  end

  test "should show study_type" do
    get study_type_url(@study_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_type_url(@study_type)
    assert_response :success
  end

  test "should update study_type" do
    patch study_type_url(@study_type), params: { study_type: {  } }
    assert_redirected_to study_type_url(@study_type)
  end

  test "should destroy study_type" do
    assert_difference('StudyType.count', -1) do
      delete study_type_url(@study_type)
    end

    assert_redirected_to study_types_url
  end
end
