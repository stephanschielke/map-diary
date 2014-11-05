class GpsCoordsController < ApplicationController
  before_action :set_gps_coord, only: [:show, :edit, :update, :destroy]

  # GET /gps_coords
  # GET /gps_coords.json
  def index
    # Array of [Lon,Lat]-Arrays (for json)
    @coord_array = GpsCoord.all.map {|c| [c.longitude.to_f, c.latitude.to_f] }

    gon.json_all = geojson_of_all_days

    gon.first_coord = GpsCoord.first

    # Flag for the CoffeeScript to decide which part to run
    gon.index = true;
  end

  # GET /gps_coords/1
  # GET /gps_coords/1.json
  def show
    gps_coord = GpsCoord.find(params[:id])
    
    gon.lat = gps_coord.latitude
    gon.lon = gps_coord.longitude
    gon.when = gps_coord.when
    
    # Flag for the CoffeeScript to decide which part to run
    gon.show = true;
  end

  def overview

    if params.include?(:day) then 
      date = Time.new(params[:year],params[:month],params[:day])
    else
      #TODO get start if current day
      date = Time.now
    end 

    @gps_coords = GpsCoord.where('when' => (date)..date+1.day)

    gon.json_today = geojson_of(@gps_coords)
    
    gon.first_coord = @gps_coords.first

    gon.availabe_days = GpsCoord.uniq.order(:when).pluck(:when).collect {|w| w.to_date}.uniq
    gon.startDate = gon.availabe_days.first
    gon.endDate = gon.availabe_days.last
    gon.selectedDate = date.to_date
    
    # Flag for the CoffeeScript to decide which part to run
    gon.overview = true;  
  end  

  def geojson_of_all_days
    return geojson_of(GpsCoord.all)
  end

  def geojson_of(gps_coords)
    Jbuilder.encode do |json| 
      json.type "LineString"
      json.coordinates gps_coords.map {|c| [c.longitude.to_f, c.latitude.to_f] }
    end
  end

  def geojson(gps_coords)
    @gps_coords = gps_coords.map {|c| [c.longitude.to_f, c.latitude.to_f] }
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
      #@gps_coord = GpsCoord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gps_coord_params
      params.require(:gps_coord).permit(:when, :longitude, :latitude, :altitude)
    end
end
