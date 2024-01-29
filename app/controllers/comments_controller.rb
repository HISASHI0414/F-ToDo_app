class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    @comment = task.comments.build
    @comment.user = current_user
    @comment.board_id = board.id
    @comment.task_id = task.id
  end

  def create
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    @comment.user = current_user
    @comment.board_id = board.id
    @comment.task_id = task.id
    if @comment.save
      redirect_to board_task_path(board_id: @comment.board_id, id: @comment.task_id), notice: 'コメントが作成されました！'
    else
      flash.now[:error] = 'コメントの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
      :comment_content
    )
  end
end
