require 'test_helper'

class MovementAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movement_account = movement_accounts(:one)
  end

  test "should get index" do
    get movement_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_movement_account_url
    assert_response :success
  end

  test "should create movement_account" do
    assert_difference('MovementAccount.count') do
      post movement_accounts_url, params: { movement_account: { movement_date: @movement_account.movement_date, value: @movement_account.value } }
    end

    assert_redirected_to movement_account_url(MovementAccount.last)
  end

  test "should show movement_account" do
    get movement_account_url(@movement_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_movement_account_url(@movement_account)
    assert_response :success
  end

  test "should update movement_account" do
    patch movement_account_url(@movement_account), params: { movement_account: { movement_date: @movement_account.movement_date, value: @movement_account.value } }
    assert_redirected_to movement_account_url(@movement_account)
  end

  test "should destroy movement_account" do
    assert_difference('MovementAccount.count', -1) do
      delete movement_account_url(@movement_account)
    end

    assert_redirected_to movement_accounts_url
  end
end
