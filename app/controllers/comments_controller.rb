class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
     @question = Question.find(params[:question_id])
     @comment = @question.comments.new(comment_params)
     @comment.user_id = current_user.id
     respond_to do |format|
      if @comment.save
        format.js
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :show, notice: 'Debes logearte para comentar' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end
 
  private def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end

end
