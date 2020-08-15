require "application_system_test_case"

class StudyTypesTest < ApplicationSystemTestCase
  setup do
    @study_type = study_types(:one)
  end

  test "visiting the index" do
    visit study_types_url
    assert_selector "h1", text: "Study Types"
  end

  test "creating a Study type" do
    visit study_types_url
    click_on "New Study Type"

    click_on "Create Study type"

    assert_text "Study type was successfully created"
    click_on "Back"
  end

  test "updating a Study type" do
    visit study_types_url
    click_on "Edit", match: :first

    click_on "Update Study type"

    assert_text "Study type was successfully updated"
    click_on "Back"
  end

  test "destroying a Study type" do
    visit study_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study type was successfully destroyed"
  end
end
