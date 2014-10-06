class GpsCoord < ActiveRecord::Base

  # Returns a formatted time string 
  # converted to the gps coordination local time zone
  def when
    # Find the timezone of the gps_coord and convert to gps local time
    timezone = Timezone::Zone.new :latlon => [read_attribute(:latitude), read_attribute(:longitude)]
    return I18n.l (timezone.time read_attribute(:when)), format: :day_date_time
  end

  # Returns the original when stored in db with utc information 
  def when_utc
    read_attribute(:when)
  end

end
