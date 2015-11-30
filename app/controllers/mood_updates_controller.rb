class MoodUpdatesController < ApplicationController
  before_action :set_mood_update, only: [:show, :edit, :update, :destroy]
  
  # GET /mood_updates
  # GET /mood_updates.json
  def index
    @user = current_user
    #@mood_updates = @user.mood_update.all
    @mood_updates = MoodUpdate.using(:moodshard).where(user_id: current_user.id)
  end

  # GET /mood_updates/1
  # GET /mood_updates/1.json
  def show
  end

  # GET /mood_updates/new
  def new
    @user = current_user
    @mood_update = @user.mood_update.new
  end

  # GET /mood_updates/1/edit
  def edit
    #@mood_update = MoodUpdate.find_by user_id: current_user.id
    @mood_update = MoodUpdate.using(:moodshard).find_by_user_id(current_user.id)
  end

  # POST /mood_updates
  # POST /mood_updates.json
  def create
    @user = current_user
    Octopus.using(:moodshard) do
      @mood_update = MoodUpdate.create(mood_update_params.merge(user_id: current_user.id))
    end
   
    respond_to do |format|
      if @mood_update.save
        format.html { redirect_to @mood_update, notice: 'Mood update was successfully created.' }
        format.json { render :show, status: :created, location: @mood_update }
      else
        format.html { render :new }
        format.json { render json: @mood_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mood_updates/1
  # PATCH/PUT /mood_updates/1.json
  def update
    respond_to do |format|
      if @mood_update.update(mood_update_params)
        format.html { redirect_to @mood_update, notice: 'Mood update was successfully updated.' }
        format.json { render :show, status: :ok, location: @mood_update }
      else
        format.html { render :edit }
        format.json { render json: @mood_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mood_updates/1
  # DELETE /mood_updates/1.json
  def destroy
    id = @mood_update.id
    MoodUpdate.using(:moodshard).find_by_id(id).destroy
    respond_to do |format|
      format.html { redirect_to mood_updates_url, notice: 'Mood update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_update
      @mood_update = MoodUpdate.using(:moodshard).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_update_params
      params.require(:mood_update).permit(:mood_id, :desc, :intensity, :user_id)
    end
end
