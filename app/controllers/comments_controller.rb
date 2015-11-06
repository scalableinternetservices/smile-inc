class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @mood_update = MoodUpdate.find(params[:mood_update_id])
    @comment = @mood_update.comment.new(comment_params)
    #@comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @mood_update
    end
      
  end

  
private
  def set_comment
    @comment = Comment.find_by mood_update_id: current_mood.id
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
