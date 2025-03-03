class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:movie_id])
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to list_path(@movie.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end
