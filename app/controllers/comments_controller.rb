class CommentsController < ApplicationController

	def create
		@mood_update = MoodUpdate.find(params[:id])
		@comments = @mood_update.comments.create!(params[:comment])

		redirect_to @mood_update

	end

end
