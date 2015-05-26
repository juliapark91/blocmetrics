class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new( event_params.merge( user_id: current_user.id ) )
    authorize @event

    if @event.save
      redirect_to @event, notice: "Application was registered successfully."
    else
      flash[:error] = "Error registering application. Please try again."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event

    if @event.update_attributes( event_params )
      redirect_to @event, notice: "Application updated successfully."
    else
      flash[:error] = "Error updating applcation. Please try again."
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    name = @event.name
    authorize @event

    if @event.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
    else
      flash[:error] = "Error deleting application. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private

  def event_params
    params.require(:event).permit(:name, :url, :user_id)
  end
end
