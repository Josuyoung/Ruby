real_numbers = [1,2,3,4,5,7]    #임의의 당첨 번호
lucky_numbers = [1,2,3,4,5,9]   #임의의 내가 고른 번호
bonus_number = 9                #보너스 번호

match_numbers = real_numbers & lucky_numbers  #배열을 비교하여 같은 원소만 가진 배열 생성
count = match_numbers.count                   #비교하여 생성된 배열의 갯수

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