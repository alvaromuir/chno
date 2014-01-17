class ProjectsController < ApplicationController
  before_action :set_event
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = @event.projects.build
  end

  def create
    @project = @event.projects.build(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to [@event, @project]
    else
      flash[:notice] = "Project has not been created."
      render 'new'
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

     def project_params
      params.require(:project).permit(:title, :description)
    end

    def set_project
      @project = @event.projects.find(params[:id])
    end

end
