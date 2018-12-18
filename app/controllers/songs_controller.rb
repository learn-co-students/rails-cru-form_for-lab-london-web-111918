class SongsController < ApplicationController

  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    redirect_to songs_path
  end

  def show

  end

  def edit
  end

  def update
    @song.update(song_params)
    redirect_to songs_path
  end

  def destroy
    @song.delete

  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
