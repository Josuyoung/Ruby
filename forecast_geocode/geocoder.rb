require 'geocoder'

print "원하는 장소를 입력하세요: "
input = gets.chomp
cord = Geocoder.coordinates input

puts "위도 : " + cord.first.to_s
puts "경도 : " +cord.last.to_s