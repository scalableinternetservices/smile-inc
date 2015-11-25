class MoodUpdatesController < ApplicationController
  before_action :set_mood_update, only: [:show, :edit, :update, :destroy]

  # GET /mood_updates
  # GET /mood_updates.json
  def index
    #@mood_updates = MoodUpdate.includes(:mood)
    @mood_updates = MoodUpdate.all
  end

  # GET /mood_updates/1
  # GET /mood_updates/1.json
  def show
  end

  # GET /mood_updates/new
  def new
    @mood_update = MoodUpdate.new
  end

  # GET /mood_updates/1/edit
  def edit
  end

  # POST /mood_updates
  # POST /mood_updates.json
  def create
    @mood_update = MoodUpdate.new(mood_update_params)

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
    @mood_update.destroy
    respond_to do |format|
      format.html { redirect_to mood_updates_url, notice: 'Mood update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood_update
      @mood_update = MoodUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_update_params
      params.require(:mood_update).permit(:mood_id, :desc, :intensity)
    end
end
