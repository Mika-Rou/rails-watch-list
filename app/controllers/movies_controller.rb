class MoviesController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.new(movie_params)
    @movie.list = @list

    if @movie.save
      redirect_to list.path(@list)
    else
      @movies = @list.movies
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
