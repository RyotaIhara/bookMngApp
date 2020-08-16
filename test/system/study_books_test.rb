require "application_system_test_case"

class StudyBooksTest < ApplicationSystemTestCase
  setup do
    @study_book = study_books(:one)
  end

  test "visiting the index" do
    visit study_books_url
    assert_selector "h1", text: "Study Books"
  end

  test "creating a Study book" do
    visit study_books_url
    click_on "New Study Book"

    click_on "Create Study book"

    assert_text "Study book was successfully created"
    click_on "Back"
  end

  test "updating a Study book" do
    visit study_books_url
    click_on "Edit", match: :first

    click_on "Update Study book"

    assert_text "Study book was successfully updated"
    click_on "Back"
  end

  test "destroying a Study book" do
    visit study_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study book was successfully destroyed"
  end
end
