class RentingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:new, :create]

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
    @renting = @car.rentings.build(renting_params)
    @renting.user = current_user
    if @renting.save
      flash[:notice] = "Renting was successfully created."
      redirect_to car_path(@car)
    else
      render 'cars/show'
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def renting_params
    params.require(:renting).permit(:start_at, :end_at)
  end
end
