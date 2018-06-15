# 1 부터 45까지의 숫자를 담은 바구니
numbers = (1..45).to_a

# 바구니에서 6개를 뽑는다.
lucky_numbers = numbers.sample(6)

#출력한다.
puts lucky_numbers.sort

# [*1..45] smaple(6) sort