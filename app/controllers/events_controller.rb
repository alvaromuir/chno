class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event has been created."
      redirect_to @event
    else
      flash[:alert] = "Event has not been created."
      render 'new'
    end
  end

  def show
    # see set_event
  end

  def edit
    # see set_event
  end

  def update
    # see set_event
    if @event.update(event_params)
      flash[:notice] = "Event has been updated."
      redirect_to @event
    else
      flash[:notice] = "Event has not been updated."
      render 'edit'
    end
  end

  def destroy
    # see set_event)
    @event.destroy

    flash[:notice] = "Event has been destroyed."

    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :description)
    end

    def set_event
      @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The event you were looking for could not be found."
      redirect_to events_path
    end
end
