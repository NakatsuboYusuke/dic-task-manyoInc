class TasksController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  def index
    #@tasks = Task.recent
    @q = Task.ransack(params[:q])
    #@tasks = @q.result(distinct: true).recent
    @tasks = @q.result.recent
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save #save!
      redirect_to task_path(@task.id), notice: "タスク「#{@task.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params) #update!
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
    params.require(:task).permit(:title, :description, :limited_at, :status)
  end

end
