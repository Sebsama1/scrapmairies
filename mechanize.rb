require 'mechanize'
require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_the_email_of_a_townhal_from_its_webpage(source)

doc = Nokogiri::HTML(open(source))

#list_email = {}

#name = doc.xpath('//h1').text
#puts name
name = doc.xpath('//h1').text
puts name
p22 = doc.css('p.Style22').text
email = p22.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
puts email

@output.write(email)
end



@output = File.new("mailsmairies", 'w+')
url = "http://annuaire-des-mairies.com/val-d-oise.html"
#Ouvre toutes les pages des mairies et en copie le contenu dans un nouveau fichier
page = Nokogiri::HTML(open(url))
links = page.css('a.lientxt')
links.each do |link|
    linkurl = link['href']
    newurl = "http://annuaire-des-mairies.com"+linkurl
    get_the_email_of_a_townhal_from_its_webpage(newurl)
#newpage = Nokogiri::HTML(open(newurl))
end
nb = links.count
puts nb
