class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: %i[show destroy]

  # GET/ Users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # post /Users
  def create
    @user = User.new(user_params) # parameters
    if @user.save
      render json: { user: @user, status: :created }
    else
      render json: { errors: @user.errors.full_messages, status: :unprocessable_entity }
    end
  end

  # PUT /users/{username}
  def update
    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  # DELETE /users/{username}
  def destroy
    user.destroy
  end

  private

  def user_params
    params.permit(:username, :email, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
