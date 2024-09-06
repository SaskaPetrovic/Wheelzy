class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cars = Car.all
    @cars = Car.order(rating: :desc).limit(4)
  end
end
