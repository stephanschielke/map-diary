class GpsCoordsController < ApplicationController
  before_action :set_gps_coord, only: [:show, :edit, :update, :destroy]

  # GET /gps_coords
  # GET /gps_coords.json
  def index
    @gps_coords = GpsCoord.all
  end

  # GET /gps_coords/1
  # GET /gps_coords/1.json
  def show
    @gps_coord = GpsCoord.find(params[:id])
    gon.lat = @gps_coord.latitude
    gon.lon = @gps_coord.longitude
    gon.when = @gps_coord.when.localtime.to_s(:long)
  end

  # GET /gps_coords/new
  def new
    @gps_coord = GpsCoord.new
  end

  # GET /gps_coords/1/edit
  def edit
  end

  # POST /gps_coords
  # POST /gps_coords.json
  def create
    @gps_coord = GpsCoord.new(gps_coord_params)

    respond_to do |format|
      if @gps_coord.save
        format.html { redirect_to @gps_coord, notice: 'Gps coord was successfully created.' }
        format.json { render :show, status: :created, location: @gps_coord }
      else
        format.html { render :new }
        format.json { render json: @gps_coord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gps_coords/1
  # PATCH/PUT /gps_coords/1.json
  def update
    respond_to do |format|
      if @gps_coord.update(gps_coord_params)
        format.html { redirect_to @gps_coord, notice: 'Gps coord was successfully updated.' }
        format.json { render :show, status: :ok, location: @gps_coord }
      else
        format.html { render :edit }
        format.json { render json: @gps_coord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gps_coords/1
  # DELETE /gps_coords/1.json
  def destroy
    @gps_coord.destroy
    respond_to do |format|
      format.html { redirect_to gps_coords_url, notice: 'Gps coord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gps_coord
      @gps_coord = GpsCoord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_coord_params
      params.require(:gps_coord).permit(:when, :longitude, :latitude, :altitude)
    end
end
