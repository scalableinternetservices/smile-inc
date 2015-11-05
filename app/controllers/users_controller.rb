class UsersController < ApplicationController
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'profiles/show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'profiles/show_follow'
  end
end
