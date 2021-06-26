module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        authors = Author.all

        render :json => authors, :include => {:books => {:only => :title}}, :except => [:created_at, :updated_at], status: :ok
      end
    end
  end
end