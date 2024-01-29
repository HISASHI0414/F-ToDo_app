class TasksController < ApplicationController
  before_action :authenticate_user! #ログインした人しかできない

  def index
    board = Board.find(params[:board_id])
    @tasks = board.tasks.all

    # 各タスクにユーザーを設定
    @tasks.each do |task|
      task.user = board.user
    end
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
    @task.user = current_user
    @task.board_id = board.id
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_task_path(board_id: @task.board_id, id: @task.id), notice: 'Taskが作成されました！'
    else
      flash.now[:error] = 'Taskの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Board.find(params[:board_id]).tasks.find(params[:id])
    # @task.user = task.user
    # @task = Task.find(params[:id])
    @comments = @task.comments.all
  end

  def edit
    @task = current_user.boards.find(params[:board_id]).tasks.find(params[:id])
  end

  def update
    @task = current_user.boards.find(params[:board_id]).tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(board_id: @task.board_id, id: @task.id), notice: 'Taskが更新されました！'
    else
      flash.now[:error] = 'Topicの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.boards.find(params[:board_id]).tasks.find(params[:id])
    task.destroy!
    redirect_to board_tasks_path, notice: '削除に成功しました。'
  end

  private
  def task_params
    params.require(:task).permit(
      :eyecatch,
      :task_title,
      :task_deadline,
      :task_content
    )
  end
end
