class ProfilesController < ApplicationController
  #Trying to show the user id
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
    if @user.update_attributes(params.permit(:username, :email, :password, :password_confirmation))
      #redirect somewhere
    end
  end
    
end
