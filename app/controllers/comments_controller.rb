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
     @comment.save!
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
 
  private def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end

end
