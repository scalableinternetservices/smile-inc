class ProfilesController < ApplicationController

  #Trying to show the user id
  def show
    @user=User.find(params[:id])
  end

  #Update user profile (so far only username, email, and description)
  def update
    @user=User.find(params[:id])
    @user.update_attributes(user_params)
  end
  
  def edit
    @user=User.find(params[:id])
  end

  private
   def user_params
     params.require(:user).permit(:username, :email, :description)
   end  
end
