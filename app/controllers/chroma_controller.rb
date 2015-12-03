class ChromaController < ApplicationController
  def index
    @moodlist = Mood.order(:mood)
    @updatelist = MoodUpdate.includes(:mood).all
  end
end
