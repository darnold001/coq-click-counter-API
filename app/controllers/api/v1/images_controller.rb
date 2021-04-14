class Api::V1::ImagesController < ApplicationController
    before_action :find_user_clicks, only: [:create, :show]

        def create
                @image = Image.new(:url => @url, :user_id => @user.id, alt:@alt )
                @image.save
            render json: @user
        end

        def index
            images = User.joins(:image)
                        .select('users.id,users.username,images.url as image_url,images.alt as image_alt').limit(1000)
            images.all
            render json: images.as_json
        end
        
        def show
            render json: @image.as_json
        end

    private

        def image_params
            params.require(:image_info).permit(:user_id, :username, :url, :alt)
        end

        def find_user_clicks
            # makes method more usable by reasigning id based on post or get req format, while still maintaining the security of the post (:image_info).
            @url = params[:url]
            @alt = params[:alt]
            id = params[:id]
            if params[:image_info] 
                @url = params[:image_info][:url]
                @alt = params[:image_info][:alt]
                id = params[:image_info][:id]
            end
            @user = User.find_by(id: id)
            @image = @user.image
        end
end
