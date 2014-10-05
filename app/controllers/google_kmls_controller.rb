class GoogleKmlsController < ApplicationController
  before_action :set_google_kml, only: [:show, :edit, :update, :destroy]

  # GET /google_kmls/1/parseKmlFile
  def parseKmlFile
    @file_contents = TextDocument.find(params[:id]).file_contents
    @xml_file = Nokogiri::XML(@file_contents)#.remove_namespaces!

    # Find all GPS-Coord data
    # '//xmlns:kml/xmlns:Document/xmlns:Placemark/gx:Track/xmlns:altitudeMode/following-sibling::*'
    @coord_data = @xml_file.xpath('//xmlns:altitudeMode/following-sibling::*') 

    # Loop over every "when"+"coord" tag pair
    @coord_data.each_slice(2) do |slice|
      # Slice contains all data for a GpsCoord:
      # <when>014-10-01T00:40:39.922-07:00</when>
      # <gx:coord>6.0983135 50.7790552 0</gx:coord>

      @gps_coord = GpsCoord.new;
      
      slice.each do |node|
        if node.name == "when" then
          # Example: "2014-10-04T14:18:35.214-07:00"
          @gps_coord.when = Time.zone.parse(node.content)    
        elsif node.name == "coord"
          # Example: "6.1003164 50.7774925 0"
          @decimals = node.content.split(" ").map {&:to_f}

          @gps_coord.longitude = @decimals[0] 
          @gps_coord.latitude = @decimals[1]
          @gps_coord.altitude = @decimals[2]
        end  
      end

      @gps_coord.save

    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def google_kml_params
      params[:google_kml]
    end
end
