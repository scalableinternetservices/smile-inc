class ChromaController < ApplicationController
  def index
    @moodlist = Mood.order(:mood)
    @updatelist = MoodUpdate.all
  end
end
