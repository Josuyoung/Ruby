#로또 시스템
require 'json'
require 'open-uri'

#랜덤 자동 로또번호 생성하기
numbers = (1..45).to_a
lucky_numbers = numbers.sample(6) 

#실제 당첨 로또 번호 가져오기
url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=809'
info = JSON.parse(open(url).read)
real_numbers = []
info.each do |key, value|
    (real_numbers << value) if key.include? 'drwtNo' 
end
bonus_number = info['bnusNo']

#로또번호 당첨체크하기
match_numbers = real_numbers & lucky_numbers #배열을 비교하여 같은 원소만 가진 배열 생성
count = match_numbers.count #비교하여 생성된 배열의 갯수

result =
    case [count, lucky_numbers.include?(bonus_number)]
    when [6,false] then '축하합니다. 1등입니다.'
    when [5,true] then '축하합니다. 2등입니다.'
    when [5,false] then '축하합니다. 3등입니다.'
    when [4,true||false] then '축하합니다. 4등입니다.'
    when [3,true||false] then '축하합니다. 5등입니다.'
    else '아쉽지만, 꽝입니다.'
    end
puts result