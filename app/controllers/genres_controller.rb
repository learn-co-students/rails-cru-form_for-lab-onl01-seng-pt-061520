class GenresController < ApplicationController
   before_action :get_genre, only: [:show, :edit, :update, :delete]
    before_action :new_genre, only: [:new]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
  end

  def create
    @genre = Genre.new(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  def edit
  end

  def update
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def get_genre
    @genre = Genre.find(params[:id])
  end

  def new_genre
    @genre = Genre.new
  end


  def genre_params(*args)
    params.require(:genre).permit(args)
  end

end
