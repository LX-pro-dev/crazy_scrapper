require 'rubygems'
require 'nokogiri' 
require 'open-uri'

url = ['http://annuaire-des-mairies.com/val-d-oise.html']

xpath = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'

page = Nokogiri::HTML(URI.open(url))

url_townhall = page.xpath(xpath).text

puts url_townhall