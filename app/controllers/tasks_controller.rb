class TasksController < ApplicationController

  

  def index
    @tasks = Task.all
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :end_date)
  end
end