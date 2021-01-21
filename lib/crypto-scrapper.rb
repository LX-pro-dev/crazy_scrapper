require 'rubygems'
require 'nokogiri' 
require 'open-uri'
  
def crypto_scrapper
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  arr_symbol = []
  arr_price = []

  all_currencies_price = page.xpath('//tr//td[5]')
  
  all_currencies_price.each do |price|
    arr_price.push(price.text)
  end

  arr_prices_crypto = arr_price.map{|price| price.gsub('$','').delete(",").to_f}

  
  all_currencies_symbol = page.xpath('//tr//td[3]')

  all_currencies_symbol.each do |symb|
    arr_symbol.push(symb.text)
  end

  

  currencies_hash = Hash.new
  currencies_hash = Hash[arr_symbol.zip(arr_prices_crypto)]
  
  crypto_hash = []
  currencies_hash.each do |symbol, price|
    crypto_hash.push(symbol => price)
  end
  return crypto_hash
end

crypto_scrapper.each do |price|
  puts price
end