#!/usr/bin/ruby -w



require 'rubygems'

require 'nokogiri'

require 'open-uri'



PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"



page = Nokogiri::HTML(open(PAGE_URL))



address = page.xpath("html/body/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td.style27/p.Style22/font")

puts address.text
