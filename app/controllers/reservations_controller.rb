class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.user_reservations(current_user)
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    case @reservation.location
    when 'airport'
      my_index = 1
    when 'hospital'
      my_index = 2
    when 'retail_park'
      my_index = 3
    when 'park_and_ride'
      my_index = 4
    end

    @carpark = Carpark.find(my_index)
    new_availability = @carpark.available - 1
    @carpark.update(available: new_availability)

    respond_to do |format|
      if @reservation.save
        format.js
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy

    case @reservation.location
    when 'airport'
      my_index = 1
    when 'hospital'
      my_index = 2
    when 'retail_park'
      my_index = 3
    when 'park_and_ride'
      my_index = 4
    end
    @carpark = Carpark.find(my_index)
    new_availability = @carpark.available + 1
    @carpark.update(available: new_availability)


    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:location, :bay_type, :vehicle_registration, :start, :duration)
    end


end
