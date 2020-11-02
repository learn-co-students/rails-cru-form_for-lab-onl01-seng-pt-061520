class GenresController < ApplicationController

    def show
        @genre = current_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params(:name))
        @genre.save
        redirect_to genre_path(@genre)
    end

    def update
        @genre = current_genre
		@genre.update(genre_params(:name))
		redirect_to genre_path(@genre)
    end

    def edit
        @genre = current_genre
    end
    
    private

    def current_genre
        Genre.find(params[:id])
    end

    def genre_params(*args)
        params.require(:genre).permit(*args)
    end

end
