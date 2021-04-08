class UsersController < ApplicationController

  def new
  end

  def create
    @user=User.new(user_params)
  end

  def destroy
  end

  private

 def user_params
  params.require(:user).permit(:email :encrypted_password).merge(user_id: current_user.id)
 end
end
