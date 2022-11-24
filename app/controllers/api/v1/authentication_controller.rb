class  Api::v1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/login
  def login
    @user = User.find_by_username(params[:username]) # only username
    if @user
      token = jwt_encode(user_id: @user.id)
      render json: { token:, user: @user }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
