class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update]

  def index
		@artists = Artist.all
	end

  def show
    find_artist
  end

  def new
    @artist = Artist.create
  end

  def create
    @artist = Artist.create(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
		@artist = Artist.find(params[:id])
	end

  def update
    @artist.update(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  private

    def find_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :bio)
    end

end
