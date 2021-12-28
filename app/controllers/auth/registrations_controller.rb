# class Auth::RegistrationsController < ApplicationController
class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
# DeviseTokenAuth::~から継承することで、devise_token_authの機能が使用可能
  private

  def sign_up_params
    params.permit(:name, :email, :password, :passwor_confirmation)
  end

end
