# Section : Appel Ruby: gems - Ligne pour appeler les gems :
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def cryptocurrencies
    print "> "
    puts "Liste des cryptomonnaies (Top Crypto CMC: 200 C_M) via le site CoinMarketCap :"
    puts " "
    website_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    crypto_symbols = website_page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
    crypto_values = website_page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')

# Initialisation du tableau "crypto_symbols" contenant les symboles des crypto :
    crypto_symbols_array = []
# Initialisation du tableau "crypto_values" contenant les valeurs des crypto :
    crypto_values_array = []
# Initialisation du tableau "crypto_currency" afin de regrouper les deux tableaux ci-dessus :
    result = []

    for sym in crypto_symbols do
		crypto_values.size.times do |i|
			crypto_values_array.push(crypto_values[i].text)
		end
		crypto_symbols_array.push(sym.text)
	end
	
# On associe pour chaque item de 'crypto_symbols_array' un item de 'crypto_values_array' :
	crypto_symbols_array.each_with_index do |k, v|
# On sauvegarde sous forme de 'hash' dans le tableau result :
		result.push({"#{k}" => "#{(crypto_values_array)[v]}"}) 
	end
	return result

end

puts cryptocurrencies
