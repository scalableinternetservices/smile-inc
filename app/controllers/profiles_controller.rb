class ProfilesController < ApplicationController
  #Trying to show the user id
  def show
    @user=User.find(params[:id])
  end

end