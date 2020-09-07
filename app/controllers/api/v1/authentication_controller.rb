class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      time = Time.now + 24.hours.to_i
      render json: { auth_token: command.result, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
