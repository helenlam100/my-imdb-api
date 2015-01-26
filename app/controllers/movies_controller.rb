class MoviesController < ApplicationController

  def all
    @movie = Movie.all
    render json: @movie
  end

  def index

  end

  def search
    @movie = (params["y"] ? Movie.where(year: params["y"]) : Movie.all)
    @movie = @movie.select { |movie| movie if movie.title.downcase.include?(params["t"].downcase)  } if params["t"]
    render json: @movie
  end
end
