class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    Task.create(task_params)
    redirect_to Task
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
