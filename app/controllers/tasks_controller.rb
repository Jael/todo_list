class TasksController < ApplicationController
  load_and_authorize_resource

  def todo
    @tasks = current_user.tasks.where(complete: false)
  end

  def done
    @tasks = current_user.tasks.where(complete: true)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      redirect_to todo_tasks_path, notice: "Created successfully"
    else
      render :new
    end
  end


  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to todo_tasks_path, notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def finish
    @task = Task.find(params[:id])
    if @task.complete?
      @task.update_attributes(complete: false) 
    else
      @task.update_attributes(complete: true)
    end
  end
end
