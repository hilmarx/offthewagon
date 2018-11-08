require 'test_helper'

class TeacherSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teacher_skills_index_url
    assert_response :success
  end

  test "should get show" do
    get teacher_skills_show_url
    assert_response :success
  end

  test "should get edit" do
    get teacher_skills_edit_url
    assert_response :success
  end

  test "should get update" do
    get teacher_skills_update_url
    assert_response :success
  end

  test "should get new" do
    get teacher_skills_new_url
    assert_response :success
  end

  test "should get create" do
    get teacher_skills_create_url
    assert_response :success
  end

end
