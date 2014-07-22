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
      @manufacturer = Manufacturer.all.map { |u| [u.name, u.id] }
      flash[:notice] = 'There was a problem saving your submission...'
      render :new
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
