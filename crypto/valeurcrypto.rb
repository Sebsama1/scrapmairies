require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_price

	while true

		page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

		result = {}
		x = 0

		while x < 978									#Pas très propre mais c'est le seul moyen que j'ai trouvé,
			price =  page.css('a.price')[x]['data-usd'] #je n'arrivais pas à selectionner ces données juste avec le
			name =  page.css('.text-left')[x+2].text	#css ou un .each
			result[name] = price
			x += 1
		end

		time = Time.now.to_s
		file = File.new(time, "w+")
		file.write(result)
		puts  result
	sleep 3600
	end

end

get_price
