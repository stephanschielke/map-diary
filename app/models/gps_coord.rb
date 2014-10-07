class GpsCoord < ActiveRecord::Base

  # Returns a formatted time string 
  # converted to the gps coordination local time zone
  def when
    # Find the timezone of the gps_coord and convert to gps local time
    timezone = NearestTimeZone.to(read_attribute(:latitude), read_attribute(:longitude))
    return I18n.l (read_attribute(:when).in_time_zone(timezone)), format: :day_date_time
  end

  # Returns the original when stored in db with utc information 
  def when_utc
    read_attribute(:when)
  end

  def to_coord_array 
    return Array[read_attribute(:longitude).to_f, read_attribute(:latitude).to_f]
  end

end
