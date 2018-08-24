# require 'open-uri'
# require 'nokogiri'
User.destroy_all
Attraction.destroy_all
Booking.destroy_all

# Fake user
u1 = User.create(
  email: "b@g.fr",
  password: "123456",
  first_name: "Boris",
  last_name: "Paillard"
)

u2 = User.create(
  email: "r@g.fr",
  password: "123456",
  first_name: "Remi",
  last_name: "Martin"
)

u3 = User.create(
  email: "a@g.fr",
  password: "123456",
  first_name: "Roger",
  last_name: "Bertrand"
)

# patter to find last part of url
pattern = /[^\/]+(?=\/$|$)/

results_array = []
my_hash = {}

url_array = [
"http://conceptevenement.com/category/location-structures-gonflables/piscines-a-boules",
"http://conceptevenement.com/category/location-animations-sportives/jeux-mecaniques"
]

url_array.each do |url|
  my_hash = {}
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.ad-box').each do |element|
    my_hash = {
      title: element.search('.post-title-CE').text.strip.gsub(/\t/, '').gsub(/\n/, ''),
      price: element.search('.prixCe').text.strip.gsub(/\t/, '').gsub(/\n/, ''),
      img: element.search('img').attribute('src').value,
      attraction_type: pattern.match(url).to_s
    }
    results_array << my_hash
  end
end

results_array.each do |hash|
  attraction = Attraction.new(
    name: hash[:title],
    attraction_type: [ "Montagnes Rousses", "Chateau Gonflable", "Rodéo","Horreur","sensation","pêche aux canard"].sample,
    playersmax: [50, 10, 5, 70, 100 ].sample,
    description: "L’attraction : Inspirée de la célèbre scène de fuite \
     en wagons des mines du film Indiana Jones et le Temple maudit, c’est \
      la seule attraction de type montagne russe de Disneyland Paris à être \
      totalement ouverte sur l’extérieur, offrant au visiteur une vue aérienne\
       du fond d’Adventureland et quelques frissons … Embarquez à bord d’un\
        petit wagon qui vous emporte au cœur d’un temple hindou en ruine, \
        digne des aventures d’Indiana Jones. Si le départ est modéré, attention\
         au looping qui approche ! Restrictions : Taille minimum\
          :1,40m / Déconseillé aux femmes enceintes / Avertissement aux\
           personnes souffrant du dos, de problèmes cardiaques et / ou\
            respiratoires.",
    price: [500, 1000, 2000, 5000, 10000 ].sample,
    image_url: hash[:img],
    user: u1,
    location: %w(Paris Lyon Marseille Bordeaux Lille).sample
  )
  attraction.save!
end

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# my_hash = {}

# my_hash[:title] = html_doc.search('.ad-title h1').first.text.strip.gsub(/\t/, '').gsub(/\n/, '')
# my_hash[:price] = html_doc.search('.prixProduitHT').first.text.strip.gsub(/\t/, '').gsub(/\n/, '')

# html_doc.search('.ad-detail-info').each do |element|
#   key = element.search('.custom-label').text.strip.gsub(/\t/, '').gsub(/\n/, '').to_sym
#   value = element.search('.ad-detail').text.strip.gsub(/\t/, '').gsub(/\n/, '').to_sym
#   my_hash[key] = value
# end

# p my_hash


current_date = Date.today
attractions = Attraction.all

for i in (0..3)
  attractions.each do |attraction|
    tmp = current_date + rand(7)
    Booking.create(
      start_date: tmp,
      end_date: tmp,
      attraction: attraction,
      user: rand(10) > 5 ? u2 : u3
    )
  end
end


