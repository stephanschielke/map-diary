class CreateGpsCoords < ActiveRecord::Migration
  def change
    create_table :gps_coords do |t|
      t.datetime :when
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :altitude

      t.timestamps
    end
  end
end
