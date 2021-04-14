class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
    def create
      @user = User.new(user_params)
      if !@user.valid? 
        render json: { error: 'failed to create user - invalid parameters.' }, status: :not_acceptable
      elsif User.exists?(:username => @user.username)
        render json: { error: 'failed to create user - username already exists.' }, status: :not_acceptable
      else
        @user.save
        @token = encode_token(@user)
        render json: { user: {username:@user.username, id:@user.id},
                       jwt: @token
                      }
      end
    end

private
      def user_params
          params.require(:user).permit( :username, :password, :id)
      end
            
    end