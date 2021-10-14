require 'nokogiri'
require 'open-uri'

URL = "https://coinmarketcap.com/all/views/all/"

def open_url(link)
	return nil if (link.empty? || link.nil?)
	page = Nokogiri::HTML(URI.open(link))
	if page then
		puts "Connexion au système de récupération de données en cours de traitement ...."
		return page
	else
		return nil
	end
end

def trader(page)

	#page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
	cryptos = []
	#list = page.css('tr.cmc-table-row')
	#i = 1

	1.upto(20) do |i|
	#list.each do
		cryptos_name_array = page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text
 		cryptos_price_array = page.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a").text.gsub('$', '').gsub(',', '').to_f
		cryptos << Hash[cryptos_name_array, cryptos_price_array]
		#puts "J'ai récupéré une donnée ahahahahah"
	#	i += 1
	end

	return cryptos
end

def perform
	
	page = open_url(URL)
	puts trader(page)

end

perform