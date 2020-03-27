class GratitudesController < ApplicationController
    def new
        @gratitude = Gratitude.new
    end

    def create
        #build doesn't save to database, but returns a new object of the associated type to be used in the view 
        @gratitude = current_user.gratitudes.build(gratitude_params)
        if @gratitude.save
            flash[:message] = "Gratitude created!"
            redirect_to gratitudes_path
        else
            @error = "Fill in your gratitude!"
            render :new
        end
    end

    def show
        @gratitude = Gratitude.find_by_id(params[:id])
        redirect_to gratitudes_path if !@gratitude
    end

    def index
        @gratitudes = Gratitude.all
    end

    def edit
        @gratitude = Gratitude.find_by_id(params[:id])
        redirect_to gratitudes_path if !@gratitude && @gratitude.user != current_user
    end
    
    def update
        @gratitude = Gratitude.find_by_id(params[:id])
        #authenticates the user and gratitude, redirects if false
        redirect_to gratitudes_path if !@gratitude && @gratitude.user != current_user
        if @gratitude.update(gratitude_params)
            redirect_to gratitude_path(@gratitude)
        else
            render :edit
        end
    end

    def destroy
        @gratitude = Gratitude.find_by(id: params[:id])
        @gratitude.destroy
        flash[:notice] = "Gratitude deleted!"
        redirect_to gratitude_path(@gratitude)
    end

    private

    def gratitude_params
        params.require(:gratitude).permit(:title, :content)
    end
end
