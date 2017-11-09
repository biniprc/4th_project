require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'csv'

get '/lunch' do
  lunch = ["a", "b", "c", "d"]
  photo = {
    "a" => "asdf",
    "b" => "qwer",
    "c" => "zcv",
    "d" => "xcvb"
  }
  @menu = lunch.sample
  @photo = photo[@menu]
  erb :lunch
end

get '/lol' do
  erb :lol
end

get '/search' do
  key = "faker"
  response = HTTParty.get("http://www.op.gg/summoner/userName=" + key)
  text = Nokogiri::HTML(response.body)
  win = text.css('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins').text
  "#{win}"
  CSV.open('log.csv', 'a+') do |csv|
    csv << [key, win]
  end
  #File.open('log.txt', 'a+') do |f|
  #  f.write(win)
  #end
end
