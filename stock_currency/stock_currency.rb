#기업명을 입력하면 관련 기업의 한주당 가격을 한국돈으로 환전하여 보여주기
require 'eu_central_bank'
require "stock_quote"


print '검색할 주식의 symbol을 입력하세요: '
input = gets.chomp #\n을 없애고(chomp을 통해서) 값을 입력하기
list = input.split(' ') #띄어쓰기로 구분하여 배열로 만들기
stocks = StockQuote::Stock.quote(list) #symbol을 리스트 또는 하나로 입력하여 관련 인스턴스 생성

bank = EuCentralBank.new #인스턴스 생성
bank.update_rates #정보 업데이트

rate = bank.exchange 100,'USD', 'KRW' #100센트 환율

if stocks.is_a? Array #배열일 경우
    stocks.each do |stock|
        puts "#{stock.company_name}의 1주당 가격은 $ #{stock.latest_price}이고 ₩ #{stock.latest_price*rate}입니다."
    end

else #한개일 경우
    puts "#{stocks.company_name}의 1주당 가격은 $ #{stocks.latest_price}이고 ₩ #{stocks.latest_price*rate}입니다."
end