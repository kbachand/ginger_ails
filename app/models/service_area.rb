class ServiceArea < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def check_address(zipcode)
    zipcodes_in_service_area = ["28202", "28204", "28206", "28207"]
  	if zipcodes_in_service_area.include?(zipcode)
  	@marker_color = "red"
    else
    @marker_color = "black"
    end

    return @marker_color
  end

end
