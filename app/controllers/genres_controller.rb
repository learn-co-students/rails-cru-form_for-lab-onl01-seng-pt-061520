class GenresController < ApplicationController
  
  before_action :find_genre, only: [:show, :edit, :update, :destroy]

  def new
    @genre = Genre.new 
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save 
      redirect_to genre_path(@genre)
    else
      render :new 
    end 
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  def destroy
  end

  def index
    @genres = Genre.all 
  end

  def show
  end

  private

  def find_genre 
    @genre = Genre.find_by(id: params[:id])
  end 

  def genre_params
    params.require(:genre).permit(:name)
  end 

end
