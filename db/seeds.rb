# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Medicalkeyword.destroy_all
Practice.destroy_all
Institution.destroy_all
User.destroy_all
Card.destroy_all

# Create a user
User.create!(
  email: "rashon@email.com",
  password: "password"
)

# Create medical keywords
puts "creating medical keywords"

medical_terms = [
  'Headache',
  'Fever',
  'Cough',
  'Sore throat',
  'Stomachache',
  'Nausea',
  'Vomiting',
  'Diarrhea',
  'Constipation',
  'Dizziness',
  'Fatigue',
  'Insomnia',
  'Rash',
  'Itching',
  'Burn',
  'Sprain',
  'Fracture',
  'Back pain',
  'High blood pressure',
  'Low blood pressure',
  'Cholesterol',
  'Diabetes',
  'Allergy',
  'Asthma',
  'Influenza',
  'Common cold',
  'Urinary tract infection',
  'Kidney stone',
  'Anxiety',
  'Depression',
  'Stress'
]

medical_terms.each do |mterm|
  Medicalkeyword.create!(term: mterm)
end

puts "making practices"
medical_practices = [
  'General Practice',
  'Internal Medicine',
  'Family Medicine',
  'Emergency Medicine',
  'Pediatrics'
]
medical_practices.each do |m_practice|
  new_practice = Practice.create!(name: m_practice, info: Faker::Lorem.sentence)
  practice_keywords = Medicalkeyword.order(Arel.sql('RANDOM()')).limit(5)
  practice_keywords.each do |keyword|
    Practicekeyword.create!(practice: new_practice, medicalkeyword: keyword)
  end
end

puts "creating institutions"
10.times do
  Institution.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    website: Faker::Internet.url,
    info: Faker::Lorem.paragraph,
    rating: Faker::Number.between(from: 1, to: 5),
    phone: Faker::PhoneNumber.phone_number
  )
end

# Additional code for creating cards if needed
card = Card.new
card.user = User.first
card.practice = Practice.first
card.institution = Institution.first
card.originalcontent = Faker::Lorem.sentence
card.translatedcontent = "チョロン、彼のサブ男性デュオHongcunヘルプ、インターネットカフェ、卓球、オフにスケートだけでなく、工芸品や骨董品店に加えて、そこが店をオープンエアコン周辺堂堂巡りをすることができます。"
card.cardkeywords = {
  "チョロン": "Choron",
  "彼のサブ男性デュオHongcunヘルプ": "His sub-male duo Hongcun help",
  "インターネットカフェ": "Internet cafe",
  "卓球": "Table tennis",
  "オフにスケート": "Skating off",
  "工芸品や骨董品店": "Crafts and antique shops",
  "オープンエアコン周辺堂堂巡り": "Open-air air conditioning area tour"
}.to_json
card.save
