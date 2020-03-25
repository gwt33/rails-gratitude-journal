class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable(email to confirm who you are), :lockable(lock users if they fail too much to sign in), :timeoutable(allow users to sign out after a certain amount of time), 
  # :trackable(keep a log od when users log in and out) and :omniauthable(log in with google, etc)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
      
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(email: data['email'],
          password: Devise.friendly_token[0,20]
          )
      end
      user  
    end         
end
