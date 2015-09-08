class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @idea = Idea.new
  end

  def create
    @idea       = Idea.new(idea_params)
    @idea.user  = current_user
    if @idea.save
      redirect_to idea_path(@idea), notice: "Idea Posted!"
    else
      flash[:alert] = "Errors while Posting"
      render :new
    end
  end

  def index
    @ideas = Idea.all
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_post(@idea), notice: "Idea Edited"
    else
      flash[:alert] = "Idea not Updated"
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end


  private

  def idea_params
    params.require(:idea).permit([:title, :body])
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

end
