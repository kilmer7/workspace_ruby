require "application_system_test_case"

class MovementAccountsTest < ApplicationSystemTestCase
  setup do
    @movement_account = movement_accounts(:one)
  end

  test "visiting the index" do
    visit movement_accounts_url
    assert_selector "h1", text: "Movement Accounts"
  end

  test "creating a Movement account" do
    visit movement_accounts_url
    click_on "New Movement Account"

    fill_in "Movement date", with: @movement_account.movement_date
    fill_in "Value", with: @movement_account.value
    click_on "Create Movement account"

    assert_text "Movement account was successfully created"
    click_on "Back"
  end

  test "updating a Movement account" do
    visit movement_accounts_url
    click_on "Edit", match: :first

    fill_in "Movement date", with: @movement_account.movement_date
    fill_in "Value", with: @movement_account.value
    click_on "Update Movement account"

    assert_text "Movement account was successfully updated"
    click_on "Back"
  end

  test "destroying a Movement account" do
    visit movement_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movement account was successfully destroyed"
  end
end
