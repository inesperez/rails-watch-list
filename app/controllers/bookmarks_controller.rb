class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all

  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list)

  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)

  end
end
