class ProjectsController < ApplicationController 
before_action :authenticate_student!

  def index
    if current_student.admin
     @projects = Project.where(student_id: current_student.id)
     #@projects = Project.where(team_id: )
     #@team_hashes = Student.find(current_student.id).teams
    end  

  end  

  def new
    @project = Project.new
    @team = Team.new
    @task = Task.new
  end 

  def create
    if current_student.admin
    @project = Project.new(
                  name: params[:name],
                  student_id: current_student.id,
                  subject:params[:subject],
                  description: params[:description]
                   )
    @project.save
  end
  end 

  def show
    @project = Project.find(params[:id])
    @teams = @project.teams 
    @tasks = @project.tasks
    @team = Team.new
    @task = Task.new
  end 

end
