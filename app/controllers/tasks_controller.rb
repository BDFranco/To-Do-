class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
    respond_to do |format|
      format.turbo_stream
      format.html { render layout: false } # Ensures modal loads inside index
    end
  end
  

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js   # AJAX response
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully deleted." }
    end
  end
  
  
  private

  def set_task
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path, alert: "Task not found." if @task.nil?
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
