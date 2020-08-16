require 'test_helper'

class StudyBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_book = study_books(:one)
  end

  test "should get index" do
    get study_books_url
    assert_response :success
  end

  test "should get new" do
    get new_study_book_url
    assert_response :success
  end

  test "should create study_book" do
    assert_difference('StudyBook.count') do
      post study_books_url, params: { study_book: {  } }
    end

    assert_redirected_to study_book_url(StudyBook.last)
  end

  test "should show study_book" do
    get study_book_url(@study_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_book_url(@study_book)
    assert_response :success
  end

  test "should update study_book" do
    patch study_book_url(@study_book), params: { study_book: {  } }
    assert_redirected_to study_book_url(@study_book)
  end

  test "should destroy study_book" do
    assert_difference('StudyBook.count', -1) do
      delete study_book_url(@study_book)
    end

    assert_redirected_to study_books_url
  end
end
