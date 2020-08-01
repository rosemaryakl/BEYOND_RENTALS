class BookingsController < ApplicationController
  before_action :find_planet, only: [:new, :create]
  before_action :find_booking, only: [:edit, :update, :show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.planet = @planet
    @booking.user = @user
    if @booking.save
      booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      flash[:success] = "Your booking was successfully updated"
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    if @booking.destroy
      flash[:success] = "Your booking has been deleted"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_planet
    @planet = Planet.find(params[:id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
