class CommentsController < ApplicationController

    def index
        #need to check if it's nested
        if params[:gratitude_id] && @gratitude = Gratitude.find_by_id(params[:gratitude_id])
            @comments = @gratitude.comments
        else
            @error = "That gratitude doesn't exist!" if params[:gratitude_id]
            @comments = Comment.all
        end
    end

    def new
        #if nested and we find the post
        if params[:gratitude_id] && @gratitude = Gratitude.find_by_id(params[:gratitude_id])
            #use the join table associations
            @comment = @gratitude.comments.build
        else
            @error = "That gratitude doesn't exist!" if params[:gratitude_id]
            @comment = Comment.new
        end
    end

    def create
        #build doesn't save to database, but returns a new object of the associated type to be used in the view 
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            flash[:message] = "Comment created!"
            redirect_to gratitude_comments_path
        else
            render :new
        end
    end

    def show
        # @comment = Comment.find_by_id(params[:id])
        # redirect_to comments_path if !@comment
    end

    def destroy
        @gratitude = Gratitude.find_by(id: params[:id])
        @gratitude.destroy
        flash[:notice] = "Recipe deleted!"
        redirect_to recipe_path(@gratitude)
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :gratitude_id)
    end
end
