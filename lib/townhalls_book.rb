require 'rubygems'
require 'nokogiri' 
require 'open-uri'

# Return the city's name
def get_town

  arr_town_name = []
  # Register URL of the website
  url_region = "https://www.annuaire-des-mairies.com/val-d-oise.html"

  page_region = Nokogiri::HTML(URI.open(url_region))

  # From the website, (1) get an array of the city name, (2) convert it to string, 
  # (3) put in downcase and replace " " to "-" if any space
  return arr_town_name = page_region.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }
end
url = 'https://www.annuaire-des-mairies.com/95/avernes.html'
xpath = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'

# Return the email of each city
def get_email (names_town)

  arr_town_email = []

  # Loop on each cities in the array to get the email
  # To avoid a latency, replace names_town.length by 10 in order to get all hashes
  for n in 0...10

    # get each link to the depute
    page_url_town = "https://www.annuaire-des-mairies.com/95/#{names_town[n]}.html"

    page_town = Nokogiri::HTML(URI.open(page_url_town))

    # If any bug when trying to get any email
    begin
      # Put each email in an array "arr_town_email"
      arr_town_email << page_town.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s
    #catch exceptions
    rescue => e

      arr_town_email << " "
    end
  end

  # return the array of all emails
  return arr_town_email
end

# Merge towns' array with emails' array
puts email_town_result = Hash[get_town.zip(get_email(get_town))]