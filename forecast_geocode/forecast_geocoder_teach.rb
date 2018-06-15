require 'geocoder'
require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = '316b59dc6de6bb4d984f417b77db67b7'
end

cord = Geocoder.coordinates 'Las Vegas'
currently = ForecastIO.forecast(cord.first, cord.last).currently

class Float
  def convert_temp(to)
    if to == 'c'
      ((self - 32) * 5 / 9).round 2
    elsif to == 'f'
      (( self * 9 / 5) + 32).round 2
    else
      raise ArgumentError, 
            "Argument must be 'c' or 'f'. '#{to}' is not appropriate"
    end
  end
end

def f_to_c (f)
  ((f - 32) * 10 / 18).round(2)
end

puts currently.summary
puts currently.apparentTemperature.convert_temp('c')



