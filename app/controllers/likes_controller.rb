class LikesController < ApplicationController

  def create
    @idea     = Idea.find params[:idea_id]
    @like     = Like.new(idea: @idea, user: current_user)
      if @like.save
        redirect_to @idea, notice: "Liked"
      else
        redirect_to @idea, alert: "Sorry, Can't like"
      end
    end

  def destroy
    @like     = Like.find params[:id]
    @idea     = Idea.find params[:idea_id]
    if can? :destroy, @like
      @like.destroy
      redirect_to idea_path(@idea), notice: "Unliked"
    else
      redirect_to new_session_path, alert: "Please Sign In"
    end
  end

end
