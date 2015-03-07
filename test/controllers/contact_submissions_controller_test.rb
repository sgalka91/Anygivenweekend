require 'test_helper'

class ContactSubmissionsControllerTest < ActionController::TestCase
  setup do
    @contact_submission = contact_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_submission" do
    assert_difference('ContactSubmission.count') do
      post :create, contact_submission: { : @contact_submission., \: @contact_submission.\, email: @contact_submission.email, message: @contact_submission.message }
    end

    assert_redirected_to contact_submission_path(assigns(:contact_submission))
  end

  test "should show contact_submission" do
    get :show, id: @contact_submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_submission
    assert_response :success
  end

  test "should update contact_submission" do
    patch :update, id: @contact_submission, contact_submission: { : @contact_submission., \: @contact_submission.\, email: @contact_submission.email, message: @contact_submission.message }
    assert_redirected_to contact_submission_path(assigns(:contact_submission))
  end

  test "should destroy contact_submission" do
    assert_difference('ContactSubmission.count', -1) do
      delete :destroy, id: @contact_submission
    end

    assert_redirected_to contact_submissions_path
  end
end
