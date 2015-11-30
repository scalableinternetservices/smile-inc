class CommentsController < ApplicationController
  def new
    #not saved yet so no worries
    @comment = Comment.new
  end
  
  def create
    @mood_update = MoodUpdate.using(:moodshard).find(params[:mood_update_id])
    #@comment = @mood_update.comment.new(comment_params)
    Octopus.using(:commentshard) do
      @comment = Comment.create(comment_params.merge(mood_update_id: @mood_update.id))
    end
    
    if @comment.save
      if current_user.id == @mood_update.user_id
        redirect_to @mood_update
      else
        redirect_to profile_path(@mood_update.user_id)
      end
    end
      
  end

  
private
  def set_comment
    @comment = Comment.using(:commentshard).find_by mood_update_id: current_mood.id
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
