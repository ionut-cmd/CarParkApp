class CarparksController < ApplicationController
  before_action :set_carpark, only: %i[ show edit update destroy ]

  # GET /carparks or /carparks.json
  def index
    @carparks = Carpark.all
  end

  # GET /carparks/1 or /carparks/1.json
  def show
  end

  # GET /carparks/new
  def new
    @carpark = Carpark.new
  end

  # GET /carparks/1/edit
  def edit
  end


  # POST /carparks or /carparks.json
  def create
    @carpark = Carpark.new(carpark_params)

    respond_to do |format|
      if @carpark.save
        format.html { redirect_to @carpark, notice: "Carpark was successfully created." }
        format.json { render :show, status: :created, location: @carpark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carpark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carparks/1 or /carparks/1.json
  def update
    if @carpark.errors.count > 0
      format.json { render json: @carpark.errors, status: :unprocessable_entity }
    end
    respond_to do |format|
      if @carpark.update(carpark_params)
        format.html { redirect_to @carpark, notice: "Carpark was successfully updated." }
        format.json { render :show, status: :ok, location: @carpark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carpark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carparks/1 or /carparks/1.json
  def destroy
    @carpark.destroy
    respond_to do |format|
      format.html { redirect_to carparks_url, notice: "Carpark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carpark
      @carpark = Carpark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carpark_params
      params.require(:carpark).permit(:location, :available, :total, :green, :disabled)
    end
end
