class ArtistsController < ApplicationController
  before_action :get_artist, only: [:show, :edit, :update, :delete]
  before_action :new_artist, only: [:new]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  private

  def get_artist
    @artist = Artist.find(params[:id])
  end

  def new_artist
    @artist = Artist.new
  end

  def artist_params
    params.require(:artist).permit!
  end

end
