class CarsController < ApplicationController
  def index
    @cars = Car.all
    @total_cars = @cars.count
  end

  def show
    @car = Car.find(params[:id])
    @renting = Renting.new
    @rentings_dates = @car.rentings.map do |renting|
      {
        from: renting.start_at,
        to: renting.end_at
      }
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:start_at, :end_at)
  end
end
