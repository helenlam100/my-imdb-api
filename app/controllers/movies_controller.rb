class MoviesController < ApplicationController

  def all
    @movie = Movie.all
    render json: @movie
  end

  def index

  end

  def search
    @movie = Movie.all

    if params.has_key?("t")
      @movie = @movie.select { |movie| movie.title.downcase.include?(params["t"].downcase) }
    end

    if params.has_key?("y")
      @movie = @movie.select { |movie| movie.year == params["y"].to_i }
    end

    if params.has_key?("i")
      @movie = @movie.select { |movie| movie.id == params["i"].to_i }
    end


    render json: @movie
  end
end
