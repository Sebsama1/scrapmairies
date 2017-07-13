require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'rubygems'


def get_the_email_of_a_townhal_from_its_webpage(source)

doc = Nokogiri::HTML(open(source))

list_email = {}

name = doc.xpath('//h1').text
puts name

p22 = doc.css('p.Style22').text
email = p22.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
puts email
output = File.new("ableiges", 'w+')
output.write(name)
output.write(email)



end
get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/ableiges.html')
