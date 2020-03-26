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

    private

    def gratitude_params
        params.require(:gratitude).permit(:title, :content)
    end
end
