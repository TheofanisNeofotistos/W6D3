# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index 
        if params[:username]
            render json: User.search(params[:username])
        else
            users = User.all 
            render json: users
        end 
    end 

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end 

    def show 
        user = User.find(params[:id])
        render json: user
    end 

    def destroy 
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end 

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else 
            render json: user.errors.full_messages, status: 422
        end
    end 

    private
    def user_params
        params.require(:user).permit(:username)
    end 
end