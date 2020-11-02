class ArtistsController < ApplicationController

    def show
        @artist = current_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def update
        @artist = current_artist
		@artist.update(artist_params(:name, :bio))
		redirect_to artist_path(@artist)
    end

    def edit
        @artist = current_artist
    end

    private

    def current_artist
        Artist.find(params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

end
