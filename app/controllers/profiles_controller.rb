class ProfilesController < ApplicationController

  
  #  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
   # @profile=Profile.find_by user_id: current_user.id
   # @attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
#   @profile = current_user.profile
    @profile=Profile.find_by user_id: current_user.id
 #   @attributes = Profile.attribute_names - %w(id user_id created_at updated_at)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile=Profile.find_by user_id: current_user.id
   # @profile= Profile.find(params[:id])
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile=Profile.find_by user_id: current_user.id
#      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
  #    params[:profile]
      params.require(:profile).permit(:first_name, :last_name, :about_me, :avatar)
    end
end
