require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    book_parameters={"title"=>"Serengeti", "author"=>"Christopher Bishop"}
    @newbook=Book.new(book_parameters)
    @newbook.save
    book_parameters={"title"=>"Fight Club", "author"=>"David Fincher"}
    @newbook=Book.new(book_parameters)
    @newbook.save
    book_parameters={"title"=>"Fire of Amazon", "author"=>"Sayandeep"}
    @newbook=Book.new(book_parameters)
    @newbook.save
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should search" do
    get search_url, params: { book_name: 'F'}
    assert_equal flash[:count_books], 2
    
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
