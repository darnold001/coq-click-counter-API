class Api::V1::ClicksController < ApplicationController
     before_action :find_user_clicks, only: [:create, :show]

    def create
        # the logic of not allowing user to click own photo would be handled on the FE
        # if click entry exists - add click
        if(@click)
            @click.update(:click_count  => @click.click_count + 1)
        else
        # create new entry - 
            @click = Click.new(:click_count => 1, :user_id => @user.id )
            @click.save
        end
        render json: @user
    end

    def index
        # shows the top 100 users, but can be filtered by the limit parameter
        limit = 100
        if params[:limit]
            limit = params[:limit]
        end
        clicks = User.joins(:click)
                    .select('users.id,users.username,clicks.click_count as click_count').order("click_count DESC").limit(limit)
            clicks.all
        render json: clicks.as_json
    end
    
    def show
        render json: {username: @user.username, user_id: @user.id, clicks: @user.click.click_count }
    end

private

    def click_params
        params.require(:click_info).permit(:user_id, :username, :clicks)
    end

    def find_user_clicks
        # makes method more usable by reasigning id based on post or get req format, while still maintaining the security of the post (:click_info).
        id = params[:id]
        if params[:click_info] 
            id = params[:click_info][:id]
        end
        @user = User.find_by(id: id)
        @click = @user.click
    end
end
