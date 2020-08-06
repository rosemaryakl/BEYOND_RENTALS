class BookingsController < ApplicationController
  before_action :find_user, only: :show
  before_action :find_planet, only: [:new, :create, :show, :accept]
  before_action :find_booking, only: [:edit, :update, :show, :destroy, :accept]

  def index
    @bookings = Booking.all
    @user = current_user
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
      @booking.save!
      redirect_to user_bookings_path(@user)
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
      redirect_to bookings_path
    else
      flash[:error] = "Something went wrong"
      redirect_to bookings_path
    end
  end

  def accept
    @booking.update(status: true)
    @booking.save!    
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_planet
    @planet = Planet.find(params[:planet_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
