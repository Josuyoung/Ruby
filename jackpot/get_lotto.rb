require 'json'
require 'open-uri'

url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=809' #나눔로또 809회차 api


info_string = open(url).read            #데이터가 문자열로 인식되어 Hash로 읽을 수 없음
info_hash = JSON.parse(info_string)     #JSON의 parse 함수를 이용해 문자열의 내용을 Hash로 사용할 수 있게 함.


real_numbers = []
info_hash.each do |key, value|          #Hash의 key값과 value값을 구분한다.
    if key.include?('drwtNo')
      real_numbers << value             #배열에 로또번호 넣기 [다른방법 : push를 이용해서도 가능]  
    end
    #(real_numbers << value) if key.include? 'drwtNo' #한줄코드로 생성하는 법
end
bonus_number = info_hash['bnusNo']           #보너스 번호 값 받기


print "로또당첨번호 : "
real_numbers.each {|num| print "#{num} "}
puts "|bonus #{bonus_number}"