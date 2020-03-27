class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!
    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env['omniauth.auth'])
  
        if @user.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
          redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
    end

        #through devise - ***if a user is not logged in, can't see another user's show page and redirects to the login page***


    #for User show page
    def show
        user_signed_in? #devise helper method
                  # .find will break and throw an error.. would need a rescue statement
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

end