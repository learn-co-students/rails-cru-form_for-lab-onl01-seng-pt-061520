class ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def new
    @artist = Artist.new 
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save 
      redirect_to artist_path(@artist)
    else
      render :new 
    end 
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def destroy
  end

  def index
    @artists = Artist.all 
  end

  def show
  end

  private

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end 

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end 

end
