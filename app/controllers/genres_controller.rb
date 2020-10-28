class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit, :update]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    if @genre
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def update
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  private

  def find_genre
    @genre = Genre.find_by_id(params[:id])
    redirect_to genre_path if !@genre
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
