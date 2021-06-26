class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_authors, only: %i[ new edit ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      add_authors
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      add_authors
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    
    redirect_to books_url
  end

  private
  
  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors
    @authors = Author.all
  end

  def add_authors
    book_author_ids.each do |author_id|
      next unless author_id.to_i > 0
      @book.author_ids = author_id
    end
  end

  def book_author_ids
    params[:book_authors][:author_ids]
  end

  def book_params
    params.require(:book).permit(:title)
  end
end
