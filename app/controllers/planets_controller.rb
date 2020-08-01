class PlanetsController < ApplicationController
  before_action :find_planet, only: [:edit, :update, :show, :destroy]

  def index
    @planets = Planet.all
  end
  
  def show
  end
  
  def new
    @user = current_user
    @planet = Planet.new
  end

  def create
    @user = current_user
    @planet = Planet.new(planet_params)
    @planet.user = @user
    if @planet.save
      planet.save!
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @planet.update(planet_params)
      flash[:success] = "Object was successfully updated"
      redirect_to planet_path(@planet)
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    if @planet.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_path
    end
  end

  private

  def find_planet
    @planet = Planet.find(params[:id])
  end
  
  def planet_params
    params.require(:planet).permit(:name, :size, :distance_from_sun, :price_per_day)
  end
end
