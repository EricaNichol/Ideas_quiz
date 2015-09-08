class CommentsController < ApplicationController

  def create
    @comment      = Comment.new comment_params
    @idea         = Idea.find params[:idea_id]
    @comment.user = current_user
    @comment.idea = @idea
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment Added"
    else
      flash[:alert] = "Comment not added"
      render '/ideas/show'
    end
  end


  private

  def comment_params
    params.require(:comment).permit([:body])
  end
end
