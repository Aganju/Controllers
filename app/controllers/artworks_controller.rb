class ArtworksController < ApplicationController
    def index
      user = User.find(params[:user_id])
      artworks = user.artworks + user.shared_artworks
      render json: artworks
    end

    def create
      new_artwork = Artwork.new(artwork_params)
      if new_artwork.save
        render json: new_artwork
      else
        render json: new_artwork.errors.full_messages, status: 422
      end
    end

    def show
      artwork = Artwork.find_by(id: params[:id])
      if artwork
        render json: artwork
      else
        render json: {}, status: 404
      end
    end


    def update
      artwork = Artwork.find(params[:id])
      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    end

    def destroy
      del_artwork = Artwork.find(params[:id])
      del_artwork.destroy
      render json: del_artwork
    end



    private
    def artwork_params
      params.require(:artwork).permit(:title, :artist_id, :image_url)
    end

  end
