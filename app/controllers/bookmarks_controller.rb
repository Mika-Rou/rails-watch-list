class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    # We need @list in our `simple_form_for`
    @list = List.find(params[:list_id])
    @boorkmark = Bookmark.new
  end

  def create
    @bookmark = bookmark.new(bookmark_params)
    if @bookmark.save
      edirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
