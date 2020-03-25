class UsersController < ApplicationController

    #for User show page
    def show
                  # .find will break and throw an error.. would need a rescue statement
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
end
