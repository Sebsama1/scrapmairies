require 'mechanize'
require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_the_email_of_a_townhal_from_its_webpage(source)

    doc = Nokogiri::HTML(open(source))
    name = doc.xpath('//h1').text
    p22 = doc.css('p.Style22').text
    email = p22.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)
    #puts name, email
    @output.write(name)
    @output.write(" : ")
    @output.write(email[0])
    @output.write(" ")
    @list_email[name]=email[0]
end


def get_all_the_urls_of_val_doise_townhalls

    @list_email = {}
    @output = File.new("mailsmairies", 'w+')
    url = "http://annuaire-des-mairies.com/val-d-oise.html"
    page = Nokogiri::HTML(open(url))
    links = page.css('a.lientxt')

    links.each do |link|
        linkurl = link['href']
        newurl = "http://annuaire-des-mairies.com"+linkurl
        get_the_email_of_a_townhal_from_its_webpage(newurl)
    end

    number_townhal = links.count
    puts number_townhal
    puts @list_email
end

get_all_the_urls_of_val_doise_townhalls
