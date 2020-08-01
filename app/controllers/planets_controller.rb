class PlanetsController < ApplicationController
  before_action :find_planet, only: [:edit, :update, :show, :destroy]

  def index
    @planets = Planet.all
  end
  
  def show
  end
  
  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(params[:planet])
    if @planet.save
      planet.save!
      redirect_to @planet
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @planet = Planet.find(params[:id])
      if @planet.update_attributes(params[:planet])
        flash[:success] = "Object was successfully updated"
        redirect_to @planet
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    if @planet.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to planets_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to planets_url
    end
  end

  private

  def find_planet
    @planet = Planet.find(params[:id])
  end
  
  def planet_params
    params.require(:planet).permit(:name, :size, :distance_from_earth, :price_per_day)
  end
end
