class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs= Song.all 
    end

    def new
        @song = Song.new 
    end

    def create
        @song = Song.new(song_params(:name, :artist_id, :genre_id))
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        @song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private
    def find_song
        @song = Song.find_by(id: params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

end
