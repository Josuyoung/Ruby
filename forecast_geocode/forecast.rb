require 'forecast_io'


ForecastIO.configure do |configuration|
  configuration.api_key = '232fdb78f64240ec4bab2de6d879e9fc'
end

forecast = ForecastIO.forecast(37.501395, 127.039651) #37.501395, 127.039651 : 멀티캠퍼스 위도,경도

#화씨를 섭씨로 변환하는 함수
def f_to_c (f)
    (f - 32 ) / 1.8 #루비는 return을 사용하지 않으면 마지막 줄을 return 값으로 인식한다. 
end

Temperature = f_to_c(forecast['currently']['apparentTemperature']).round(2)
puts Temperature.to_s + "℃"

