class CarsController < ApplicationController
  def index
    @car = Car.order('created_at DESC')
  end

  def new
    @manufacturer = Manufacturer.all.map { |u| [u.name, u.id] }
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = 'Successfully created...'
      redirect_to cars_path
    else
      flash[:notice] = 'There was a problem saving your submission...'
      redirect_to new_car_path
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :year, :model, :mileage, :color, :description,
      :manufacturer_id
    )
  end
end
