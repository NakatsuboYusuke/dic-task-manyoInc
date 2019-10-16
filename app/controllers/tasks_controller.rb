class TasksController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :discription)
  end

end
