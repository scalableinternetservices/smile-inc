class ProfilesController < ApplicationController

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile=Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile=Profile.find_by user_id: current_user.id
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
    end

  #Note: update this everytime we add a new attribute to Profile model
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :about_me, :avatar)
    end
end
