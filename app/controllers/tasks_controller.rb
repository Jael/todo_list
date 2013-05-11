class TasksController < ApplicationController
  def todo
    @tasks = Task.where(complete: false)
  end

  def done
    @tasks = Task.where(complete: true)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
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
    redirect_to :back, notice: "Destroyed successfully"
  end

  def finish
    @task = Task.find(params[:id])
    @task.update_attributes(complete: true)
  end

end
