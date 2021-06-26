class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    
    redirect_to root_path
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name, :date_of_birth)
    end
end
