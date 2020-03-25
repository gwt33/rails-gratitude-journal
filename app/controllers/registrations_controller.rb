class RegistrationsController < Devise::RegistrationsController

    # permits all the attributes we want, for example if we wanted name or username (we put it in as an argument)
    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
     
      def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
      end


end