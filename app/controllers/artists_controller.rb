class ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :edit, :update]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    #byebug
    @artist = Artist.new(artist_params)
    @artist.save
    if @artist
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def update
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  private

  def find_artist
    @artist = Artist.find_by_id(params[:id])
    redirect_to artist_path if !@artist
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

end
