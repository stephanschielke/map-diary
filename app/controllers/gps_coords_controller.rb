class GpsCoordsController < ApplicationController
  before_action :set_gps_coord, only: [:show, :edit, :update, :destroy]

  # GET /gps_coords
  # GET /gps_coords.json
  def index
    # For performance, just grab the first 1000
    @gps_coords = GpsCoord.all

    # Array of [Lon,Lat]-Arrays (for json)
    @coord_arrays = @gps_coords.map {|c| [c.longitude.to_f, c.latitude.to_f] }

    # Can't figure out how to get the jbuilder json string for this action or @gps_coords...
    # I'm just leaving it here to solve it later on... 
    #gon.json = render_to_string( template: 'gps_coords/index.json.jbuilder', locals: { gps_coords: @gps_coords})
    #@json = render_to_string(:action => "index.json.jbuilder", :layout => false)
    #@json = @gps_coords.to_json
    #render("gps_coords/index.json.jbuilder") 
    #gon.json = @json
    gon.url = request.url

    gon.gps_coords = @gps_coords

    # Flag for the CoffeeScript to decide which part to run
    gon.index = true;
  end

  # GET /gps_coords/1
  # GET /gps_coords/1.json
  def show
    @gps_coord = GpsCoord.find(params[:id])
    
    gon.lat = @gps_coord.latitude
    gon.lon = @gps_coord.longitude
    gon.when = @gps_coord.when
    
    # Flag for the CoffeeScript to decide which part to run
    gon.show = true;
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
