require 'test_helper'

class MemberTournamentsControllerTest < ActionController::TestCase
  setup do
    @member_tournament = member_tournaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_tournaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_tournament" do
    assert_difference('MemberTournament.count') do
      post :create, member_tournament: { \: @member_tournament.\, memberId: @member_tournament.memberId, tournamentId: @member_tournament.tournamentId }
    end

    assert_redirected_to member_tournament_path(assigns(:member_tournament))
  end

  test "should show member_tournament" do
    get :show, id: @member_tournament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_tournament
    assert_response :success
  end

  test "should update member_tournament" do
    patch :update, id: @member_tournament, member_tournament: { \: @member_tournament.\, memberId: @member_tournament.memberId, tournamentId: @member_tournament.tournamentId }
    assert_redirected_to member_tournament_path(assigns(:member_tournament))
  end

  test "should destroy member_tournament" do
    assert_difference('MemberTournament.count', -1) do
      delete :destroy, id: @member_tournament
    end

    assert_redirected_to member_tournaments_path
  end
end
