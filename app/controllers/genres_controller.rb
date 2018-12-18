class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end

  def show
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  def destroy
    @genre.destroy
    @genres = Genre.all
    redirect_to genres_path(@genres)

  end

  private

  def find_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
