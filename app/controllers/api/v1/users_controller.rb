class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.load_users(params[:page], params[:per_page])

    render json: @users, root: "data"
  end

  # GET /users/1
  def show
    render json: @user, root: "data"
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, root: "data"
    else
      render json: @user.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, root: "data"
    else
      render json: @user.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.user_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_name, :user_pass, :user_role,:employee_id)
    end
end
