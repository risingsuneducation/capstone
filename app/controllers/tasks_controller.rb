class TasksController < ApplicationController

  def index
    @tasks = Task.where(project_id: params[:project_id])
    @project_id = params[:project_id]
  end 

  def new
    @task = Task.new
  end 

  def create
    @task = Task.new(
                    deadline: params[:deadline],
                    points: params[:points],
                    description: params[:description],
                    project_id: params[:project_id],
                   )
    @task.save
  end 

end
