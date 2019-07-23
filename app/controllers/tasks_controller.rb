# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :task_find, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to Task
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to Task
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def task_find
    @task = Task.find(params[:id])
  end
end
