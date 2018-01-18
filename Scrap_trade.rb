require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_sith()
	stock = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	cryptomonnaies = doc.css("#currencies-all > tbody:nth-child(2) tr")
	cryptomonnaies.each do |cryptomonnaie|
		nom = cryptomonnaie.css("a.currency-name-container").text
		price = cryptomonnaie.css("a.price").text
		stock << {:name => nom , :price => price }
	end
	stock
end

puts trader_sith

#On créé une fonction "trader_sith".
#On créé un tableau "stock", vide par défaut.
#La variale "doc" ouvre l'url d'infos des crypto-monnaies.
#On créé la variable "cryptomonnaies" pour aller chercher, avec le css, les données des cryptos.
#On sépare les données de chaque cryptos.
#Dans la variable "nom", on stocke le nom de la crypto grace au css.
#Dans la variable "price", on stocke la valeur actuelle de la crypto toujour grace au css.
#On rempli le tableau "res" avec les hashs contenants le nom et la valeur de lka crypto et ça pour chaque cryptos.
#On affiche le résultat de la fonction "Trader_sith".