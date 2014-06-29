class ManufacturersController < ApplicationController
  def index
    @manufacturer = Manufacturer.order('name ASC')
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = 'Successfully created...'
      redirect_to manufacturers_path
    else
      flash.now[:notice] = 'There was a problem saving your submission...'
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
