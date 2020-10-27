class GenresController < ApplicationController
    before_action :find_genre, only: [:show, :update]

    def new
        @genre = Genre.new
    end
    
    def show
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end
    
    def update
        @genre.update(artist_params)
        redirect_to genre_path(@genre)
    end
    
    private

    def genre_params
        params.require(:genre).permit(:name)
    end

    def find_genre
        @genre = Genre.find(params[:id])
    end
end
