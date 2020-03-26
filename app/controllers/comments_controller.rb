class CommentsController < ApplicationController

    def index
        #need to check if it's nested
        if params[:gratitude_id] && @gratitude = Gratitude.find_by_id(params[:gratitude_id])
            @comments = @comment.gratitudes
        else
            @error = "That gratitude doesn't exist!" if params[:gratitude_id]
            @comments = comment.all
        end
    end

    def new
        # 
        if params[:gratitude_id] && @gratitude = Gratitude.find_by_id(params[:gratitude_id])
            @comments = @gratitude.comments.build
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
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        # @comment = Comment.find_by_id(params[:id])
        # redirect_to comments_path if !@comment
    end


    private

    def comment_params
        params.require(:comment).permit(:content, :gratitude_id)
    end
end
