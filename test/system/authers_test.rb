require "application_system_test_case"

class AuthersTest < ApplicationSystemTestCase
  setup do
    @auther = authers(:one)
  end

  test "visiting the index" do
    visit authers_url
    assert_selector "h1", text: "Authers"
  end

  test "should create auther" do
    visit authers_url
    click_on "New auther"

    fill_in "Address", with: @auther.address
    fill_in "Name", with: @auther.name
    click_on "Create Auther"

    assert_text "Auther was successfully created"
    click_on "Back"
  end

  test "should update Auther" do
    visit auther_url(@auther)
    click_on "Edit this auther", match: :first

    fill_in "Address", with: @auther.address
    fill_in "Name", with: @auther.name
    click_on "Update Auther"

    assert_text "Auther was successfully updated"
    click_on "Back"
  end

  test "should destroy Auther" do
    visit auther_url(@auther)
    click_on "Destroy this auther", match: :first

    assert_text "Auther was successfully destroyed"
  end
end
