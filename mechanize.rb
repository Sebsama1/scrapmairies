
require 'open-uri'
require 'mechanize'
require 'nokogiri'
require 'rubygems'

def get_the_email_of_a_townhal_from_its_webpage(source)

  doc = Nokogiri::HTML(open(source))
  list_email = {}
  name = doc.xpath('//h1').text
  puts name

end





def get_all_the_urls_of_val_doise_townhalls()
    url = "http://annuaire-des-mairies.com/val-d-oise.html"

    agent = Mechanize.new
    page = agent.get(url)
    links = page.css(".lientxt")

    links.each{|link|
        puts "#{link.text} #{link['href']}"
      #get_the_email_of_a_townhal_from_its_webpage(link['href'])
      }

end

get_all_the_urls_of_val_doise_townhalls()
