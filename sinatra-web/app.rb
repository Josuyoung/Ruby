require 'sinatra'
require "sinatra/reloader" if development?
require "artii"
require 'json'
require 'open-uri'
require 'eu_central_bank'
require "stock_quote"


get '/' do
    fonts = ['3-d', 'speed', 'big', 'acrobatic']
    text = ['Hack Your Life', 'Neo', 'Happy Hacking', 'Winter is coming']
    
    a = Artii::Base.new(font: fonts.sample)
    @output = a.asciify(text.sample)
    erb(:index)
end

get '/lotto' do
    lucky_numbers = [*1..45].sample(6).sort
    url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=809'
    info = JSON.parse(open(url).read)
    real_numbers = []
    info.each do |key, value|
        (real_numbers << value) if key.include? 'drwtNo' 
    end
    bonus_number = info['bnusNo']
    
    
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
    
    @lucky_numbers = lucky_numbers.to_s
    @real_numbers = real_numbers
    @bonus_numbers = bonus_number
    @result = result
    erb(:lotto)
end


get '/stock/:symbol' do
    bank = EuCentralBank.new #인스턴스 생성
    bank.update_rates #정보 업데이트
    rate = bank.exchange 100,'USD', 'KRW' #100센트 환율
    stock = StockQuote::Stock.quote('fb')

    @stock = stock
    @rate = rate
    @input = params[:symbol]
    erb(:stock)
end