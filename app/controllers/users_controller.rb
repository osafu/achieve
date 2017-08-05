class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end

end
