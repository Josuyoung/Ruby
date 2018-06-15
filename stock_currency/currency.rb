# https://github.com/RubyMoney/eu_central_bank 사이트 참고
require 'eu_central_bank'

bank = EuCentralBank.new #인스턴스 생성
bank.update_rates #정보 업데이트

rate = bank.exchange 100,'USD', 'KRW'

puts rate