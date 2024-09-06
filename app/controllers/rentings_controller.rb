class RentingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[new create]

  def index
    @rentings = current_user.rentings
  end

  def destroy
    @renting = Renting.find(params[:id])
    if @renting.user == current_user
      @renting.destroy
      flash[:notice] = "Renting successfully canceled."
    end
    redirect_to rentings_path
  end

  def create
    @renting = @car.rentings.build(renting_params.merge(user: current_user))
    if @renting.start_at.blank? || @renting.end_at.blank?
      flash[:alert] = "Please select both start and end dates."
    elsif @renting.save
      flash[:notice] = "Renting was successfully created."
    else
      flash[:alert] = "Car is already booked."
    end
    redirect_to car_path(@car)
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def renting_params
    params.require(:renting).permit(:start_at, :end_at)
  end
end
