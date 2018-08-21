# require 'open-uri'
# require 'nokogiri'
User.destroy_all
Attraction.destroy_all
Booking.destroy_all

# Fake user
u1 = User.create(
  email: "boris@lewagon.fr",
  password: "123456"
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
    attraction_type: "Test",
    playersmax: 50,
    description: "Trop bien",
    price: rand(50..100),
    image_url: hash[:img],
    user: u1
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

for i in (0..7)
  attractions.each do |attraction|
    Availability.create(
      date: current_date,
      attraction: attraction,
      is_available: (rand < O.5 ? true : false)
    )
  end
  current_date += 1
end


