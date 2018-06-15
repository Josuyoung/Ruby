#기업명을 입력하면 관련 기업의 한주당 가격을 한국돈으로 환전하여 보여주기 - ARGV를 이용한 간편한 코드
#사용법 stock_currency_teach.rb (원하는 기업 띄어쓰기로 구분하여 쓰기)

require 'eu_central_bank'
require "stock_quote"

bank = EuCentralBank.new #인스턴스 생성
bank.update_rates #정보 업데이트
rate = bank.exchange 100,'USD', 'KRW' #100센트 환율

inputs = ARGV


inputs.each do |input|
    stock = StockQuote::Stock.quote(input)
    puts "#{stock.company_name}의 1주당 가격은 $ #{stock.latest_price}이고 ₩ #{stock.latest_price*rate}입니다."
end
