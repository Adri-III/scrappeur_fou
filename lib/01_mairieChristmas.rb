require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

# Déclaration de page_web :
def page_web
	pageWeb = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
	return pageWeb
end

# Collecte de l'email d'une mairie d'une ville du Val d'Oise :
def get_townhall_email(townhall_url)
# On indique un site URL neutre qui sera indiqué dans la prochaine méthode :
	website_page = Nokogiri::HTML(URI.open(townhall_url)) 
	email_array = []

	email = website_page.xpath('//*[contains(text(), "@")]').text
# On divise la string pour pouvoir récupérer uniquement le nom de la ville :
	ville = website_page.xpath('//*[contains(text(), "Adresse mairie de")]').text.split 

# On indique la position du nom de la ville dans la string pour la récupérer :
	email_array.push({ville[3] => email})  
	
	puts email_array
	return email_array
end

# Collecte de toutes les URLs des villes du Val d'Oise :
def get_townhall_urls
	page = page_web
	url_array = []

# Toutes les URLs appartiennent à la classe lientxt :
	urls_all = page.xpath('//*[@class="lientxt"]/@href') 
# Pour chaque URLs récupérés, il faut leur indiquer l'url parent "http://annuaire-des-mairies.com" :
	for url in urls_all do
# À l'url parent, on ajoute les urls récupérés du deuxième caractère au dernier caractère, car on veut se débarasser du point devant :
		url = "http://annuaire-des-mairies.com" + url.text[1..-1]
		url_array.push(url)	
	end

	return url_array
end

# Synchronisation des noms de villes suivis des adresse emails :
def scrapp_data
    print "> "
	puts "Voici la liste des noms de villes suivies de leurs adresses emails :"
	puts " "
	url_array = get_townhall_urls
# Pour chaque URL d'une ville du Val d'Oise, on associe l'adresse email de la mairie :
	for townhall_url in url_array do
		get_townhall_email(townhall_url)
	end
end 

scrapp_data