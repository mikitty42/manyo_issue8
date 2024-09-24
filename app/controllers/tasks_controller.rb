class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def new
      @task = Task.new
  end
  
  def create
      @task = Task.new(task_params)
      if params[:back]
          render :new, status: :unprocessable_entity
      else
          if @task.save
              flash[:danger] = 'Taskを投稿しました'
              redirect_to tasks_path
          else
              render :new, status: :unprocessable_entity
          end
          
      end
  end
  
  def show
      @task = Task.find(params[:id])
  end

  def edit
      @task = Task.find(params[:id])
  end
  
  def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
          flash[:notice] = 'Taskを編集しました'
          redirect_to tasks_path
      else
          render :edit, status: :unprocessable_entity
  
      end
  end
  
  def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = 'Taskを削除しました'
      redirect_to tasks_path
  end
  
  
  def confirm
      @task = Task.new(task_params)
      render new if @task.invalid?
  end
  private
  
  def task_params
      params.require(:task).permit(:title,:content)
  end
end
