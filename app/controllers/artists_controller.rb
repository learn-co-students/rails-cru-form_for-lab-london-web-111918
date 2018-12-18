class ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artists_path
  end

  def show

  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    @artist.delete

  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

end
