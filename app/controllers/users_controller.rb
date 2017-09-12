class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :verify_access, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:role )
  end

  def verify_access
    if !current_user.admin? || @user.id == current_user.id
      access_denied
    end
  end
end
