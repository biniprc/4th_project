require 'httparty'
require 'nokogiri'

url = "http://finance.naver.com/sise"
response = HTTParty.get(url) # HTTParty를 통해 url에 있는 정보를 가져온다.
text = Nokogiri::HTML(response.body) # Nokogiri를 통해 검색이 용이한 문서를 만든다
# Nokogiri::XML => xml parsing할때 쓴다.

kospi = text.css('#KOSPI_now') # .css를 통해 셀렉터를 기준으로 요소를 검색한다.

puts kospi.text # .text를 쓰는 이유는 tag 안에 있는 요소를 가져오기 위해서

