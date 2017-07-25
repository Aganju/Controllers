class ArtworkSharesController < ApplicationController

    def create
      new_artwork_share = ArtworkShare.new(artwork_share_params)
      if new_artwork_share.save
        render json: new_artwork_share
      else
        render json: new_artwork_share.errors.full_messages, status: 422
      end
    end

    def destroy
      del_artwork_share = ArtworkShare.find(params[:id])
      del_artwork_share.destroy
      render json: del_artwork_share
    end


    private
    def artwork_share_params
      params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end

  end
