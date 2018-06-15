require 'geocoder'
require 'forecast_io'

#화씨를 섭씨로 변환하는 함수생성
def f_to_c (f)
  ((f - 32) * 10 / 18).round(2)
end

#날씨정보 객체생성
ForecastIO.configure do |configuration|
  configuration.api_key = '316b59dc6de6bb4d984f417b77db67b7'
end

#지역정보 객체생성
print "원하는 장소를 입력하세요: "
input = gets.chomp
geocoder = Geocoder.coordinates input

#해당지역의 현재정보 객체생성
currently = ForecastIO.forecast(geocoder.first, geocoder.last).currently
Weather = currently.summary
Temperature = f_to_c(currently.apparentTemperature).round(2)

#결과값 출력
puts Weather
puts Temperature.to_s + "℃"
