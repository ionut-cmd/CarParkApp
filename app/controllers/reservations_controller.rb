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

  # returns current carpark
  def get_parking_lot
    @carpark = Carpark.find_or_create_by(location: @reservation.location )
  end


  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    # Update the available spaces in the carpark
    if @reservation.save
      new_availability = get_parking_lot.available - 1
      @carpark.update(available: new_availability)

      case @reservation.bay_type
      when 'green'
        green_avl = get_parking_lot.green - 1
        @carpark.update(green: green_avl)
      when 'disabled'
        disabled_avl  = get_parking_lot.disabled - 1
        @carpark.update(disabled: disabled_avl)
      end
    end
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
    # update carpark availability
    new_availability = get_parking_lot.available + 1
    @carpark.update(available: new_availability)

    # update bay_type availability
    case @reservation.bay_type
    when 'green'
      green_avl = get_parking_lot.green + 1
      @carpark.update(green: green_avl)
    when 'disabled'
      disabled_avl  = get_parking_lot.disabled + 1
      @carpark.update(disabled: disabled_avl)
    end


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
