class TasksController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_forbided

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result.page(params[:page]).recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "タスク「#{@task.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task.id), notice: "タスク「#{@task.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました。"
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :limited_at, :status, :priority)
  end

end
