class TasksController < ApplicationController

  def show
  end

  def new
    board = Board.find(params[:home_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:home_id])
    @task = board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to home_path(board), notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :end_date, :eyecatch)
  end
end