class CarsController < ApplicationController

  def index
    @car = Car.all
  end

  def new
    @manufacturer = Manufacturer.all.map{ |u| [ u.name, u.id ] }
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params['manufacturer_id'])
    @car.manufacturer = @manufacturer
    if @car.save
      flash[:notice] = 'Successfully created...'
      redirect_to cars_path
    else
      flash.now[:notice] = 'There was a problem saving your submission...'
      render :new
    end
  end

  private
  def car_params
    params.require(:car).permit(:year, :model, :mileage, :color, :description, :manufacturer)
  end
end
