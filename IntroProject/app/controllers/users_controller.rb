# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: users
    end 

    def create
        user = User.new(params.require(:user).permit(:username))
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

    def delete 
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end 

    def update
        user = User.find(params[:id])
        if user.update(require(:user).permit(:username))
            redirect_to user_url(user)
        else 
            render json: user.errors.full_messages, status: 422
        end
    end 
end