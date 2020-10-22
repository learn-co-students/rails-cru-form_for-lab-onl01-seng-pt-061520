class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @song.update(post_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def show
    # byebug
    @genre = set_song.genre
    @artist = set_song.artist
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def post_params(*args)
    params.require(:song).permit(*args)
  end
end
