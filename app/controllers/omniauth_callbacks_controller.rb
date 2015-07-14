class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def google_oauth2
  #   user = User.from_omniauth(request.env['omniauth.auth'])
  #   if user.persisted?
  #     sign_in_and_redirect user
  #   else
  #     session['devise.user_attributes'] = user.attributes
  #     flash.notice = 'You need to sign in through Google in order to access the site!'
  #     redirect_to root
  #   end
  # end
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to root_path #new_user_registration_url
      end
  end
end
