real_numbers = [1,2,3,4,5,7]  #당첨 로또 번호
bonus_number = 7              #보너스 번호 
lucky_numbers = [1,2,3,4,5,6] #내가 고른 번호

count = 0                     #맞춘 갯수
count_special = 0             #보너스 맞춘 갯수

lucky_numbers.each do |number|
    real_numbers.each do |num|
        if num == number
            count +=1
        end
    end
    if number == bonus_number
        count_special = 1
    end
end

if count == 6
    puts "축하합니다. 1등입니다."
elsif count == 5 && count_special == 1
    puts "축하합니다. 2등입니다."
elsif count == 5 && count_special == 0 
    puts "축하합니다. 3등입니다."
elsif count == 4
    puts "축하합니다. 4등입니다."
elsif count == 3
    puts "축하합니다. 5등이니다."
else
    puts "아쉽지만 꽝입니다."
end