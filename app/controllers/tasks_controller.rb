class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def new
      @task = Task.new
  end
  
  def create
      @task = Task.new(task_params)
      if @task.save
          flash[:danger] = 'Taskを投稿しました'
          redirect_to tasks_path
      else
          render :new, status: :unprocessable_entity
      end
  end
  
  def show
      @task = Task.find(params[:id])
  end

  def edit
  end
  
  
  private
  
  def task_params
      params.require(:taks).permit(:title,:content)
  end
end
