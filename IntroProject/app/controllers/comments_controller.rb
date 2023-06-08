class CommentsController < ApplicationController
    def index 
        if params[:user_id] 
            render json: Comment.find_by(author_id: params[:user_id]).author
        elsif params[:artwork_id]
            render json: Comment.find_by(artwork_id: params[:artwork_id]).artwork 
        end 
    end 

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment.artwork
        else
            render json: comment.errors.full_messages, status: 422
        end
    end 

    def destroy 
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to artwork_url
    end 

    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end 
end
