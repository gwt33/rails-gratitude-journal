class UsersController < ApplicationController
    #through devise - ***if a user is not logged in, can't see another user's show page and redirects to the login page***
    before_action :authenticate_user!


    #for User show page
    def show
        user_signed_in? #devise helper method
                  # .find will break and throw an error.. would need a rescue statement
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
end
