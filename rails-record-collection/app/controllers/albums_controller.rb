class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit 
    @album = Album.find(params[:id])
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])
 
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destory

    redirect_to articles_path
  end

end

private
  def album_params
    params.require(:album).permit(:title, :artist, :year_released)
  end
