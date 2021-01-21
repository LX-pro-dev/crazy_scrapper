require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Return all the deputies' names from the website
def get_deputes_name

  arr_deputies_name = []
  # Register URL's website
  url_deputies = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  deputy_page = Nokogiri::HTML(URI.open(url_deputies))

  # From the website, (1) get an array of the city name, (2) convert it to string
  return arr_deputies_name = deputy_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/text()").map {|x| x.to_s }
end

# Return all the link to the deputy email
def get_deputes_link

  arr_deputies_name = []
  # Régister URL of the needed website
  url_deputies = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  deputy_page = Nokogiri::HTML(URI.open(url_deputies))

  # From the website, (1) get an array of the city name, (2) convert it to string
  return arr_deputies_name = deputy_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/@href").map {|x| x.to_s }
end

# Return all the deputies' email from the website
def get_deputies_email (deputies_name)

  arr_deputies_email = []

  # Loop on each link an get deputy email
  # To avoid a latency, replace deputies_name.length by 10 in order to get all hashes
  for n in 0...10

    # get each link to the depute
    url_deputies = "http://www2.assemblee-nationale.fr/#{deputies_name[n]}"

    # Connect to the page
    deputy_page = Nokogiri::HTML(URI.open(url_deputies))

    # If any bug when trying to get any email
    begin

      # Put each email in an array
      arr_deputies_email << deputy_page.xpath("//*[contains(@class, 'deputes-liste-attributs')]/dd[4]/ul/li[2]/a/text()").to_s
    # catch exception
    rescue => e

        arr_deputies_email << " "
      end
  end

  # return the array of deputies' emails
  return arr_deputies_email
end

# Merge deputies' names array with deputies' emails array
puts email_town_result = Hash[get_deputes_name.zip(get_deputies_email(get_deputes_link))]