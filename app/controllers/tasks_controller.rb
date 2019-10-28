class TasksController < ApplicationController

  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  before_action :set_labels, only: [:create, :update]
  before_action :current_user?, only: [:edit, :update, :destroy]
  skip_before_action :login_forbided

  def index

    @tasks = current_user.tasks.page(params[:page]).recent
    @q = Task.ransack
    if params[:sort]
      @q = current_user.tasks.ransack(params[:q])
      @tasks = @q.result.page(params[:page]).recent
    elsif params[:q]
      @labels = Label.all
      @q = current_user.tasks.ransack(params[:q])
      @tasks = @q.result(distinct: true).includes(:labels, :labellings).page(params[:page]).recent
    end
  end

  def show
    raise Forbidden unless current_user.id == @task.user_id
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      @task.save_labels(@lables)
      redirect_to task_path(@task.id), notice: "タスク「#{@task.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @labels = @task.labels.pluck(:term).join(',')
  end

  def update
    if @task.update(task_params)
      @task.save_labels(@lables)
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

  def set_labels
    @lables = params[:task][:term].split(',')
  end

  def task_params
    params.require(:task).permit(:title, :description, :limited_at, :status, :priority, label_ids: [])
  end

  def current_user?
    @task = Task.find(params[:id])
    raise Forbidden unless @task.user_id == current_user.id
  end

end
