class TasksController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource :garden
  load_and_authorize_resource :bed, :through => :garden

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    puts "TaskController#new Task:new"
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.garden = @garden
    if @task.save
      redirect_to @garden, :notice => "Successfully created task."
    else
      render :action => 'new'
    end
  end


  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice  => "Successfully updated task."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to garden_tasks_url, :notice => "Successfully destroyed task."
  end
end
