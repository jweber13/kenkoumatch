# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Practicekeyword.destroy_all
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
  'Rash',
  'Itching',
  'Redness',
  'Swelling',
  'Dryness',
  'Scaling',
  'Blisters',
  'Pain',
  'Soreness',
  'Discoloration',
  'Fever',
  'Cough',
  'Diarrhea',
  'Vomiting',
  'Fatigue',
  'Abdominal pain',
  'Nasal congestion',
  'Sore throat',
  'Ear pain',
  'Stiffness',
  'Limited range of motion',
  'Weakness',
  'Instability',
  'Deformity',
  'Numbness',
  'Tingling',
  'Difficulty walking',
  'Toothache',
  'Tooth sensitivity',
  'Gum swelling',
  'Bleeding gums',
  'Bad breathe',
  'Toothe discoloration',
  'Jaw pain',
  'Loose teeth',
  'Difficulty chewing',
  'Muscle weakness',
  'Joint stiffness',
  'Balance problems',
  'Difficulty walking',
  'Muscle spasms',
  'Postual problems',
  'Functiona; limitations',
  'Menstrual irregularities',
  'Pelvic pain',
  'Vaginal bleeding',
  'Infertility',
  'Sexual dysfunction',
  'Depression',
  'Anxiety',
  'Mood swings',
  'Insomnia',
  'Loss of interest',
  'Changes in appetite',
  'Irritability',
  'Difficulty concentrating',
  'Suicidal thoughts',
  'Headache',
  'Dizziness',
  'Seizures',
  'Tremors',
  'Memory problems',
  'Coordination difficulties',
  'Speech difficulties',
  'Vision changes',
  'Chest pain',
  'Shortness of breath',
  'Palpitations',
  'Edema',
  'High blood pressure',
  'Irregular heartbeat',
  'Fainting',
  'Leg pain or cramping',
  'Blurred vision',
  'Eye pain',
  'Dry eyes',
  'Eye discharge',
  'Double vision',
  'Flashes of light',
  'Floaters in vision',
  'Vision loss',
  'Weight changes',
  'Mood swings',
  'Hair loss',
  'Irregular menstrual periods',
  'Excessive thirst',
  'Increased urination',
  'Temperature intolerance',
  'Changes in appetite',
  'Low libido',
  'Shortness of breath',
  'Wheezing',
  'Chest tightness',
  'Sputum production',
  'Chronic cough',
  'Difficulty breathing',
  'Chest pain',
  'respiratory infections',
  'Braces',
  'Invisalign',
  'Retainer',
  'Overbite',
  'Underbite',
  'Crossbite',
  'Crowding',
  'Gaps between teeth',
  'Spinal adjustment',
  'Back pain',
  'Neck pain',
  'Joint pain',
  'Muscle stiffness',
  'tingling',
  'Sciatica',
  'Family doctor',
  'General physician',
  'Nausea',
  'Routine check-ups',
  'Common illness',
  'child',
  'kid',
  'skin',
  'hair',
  'surgery',
  'bones'
]

medical_terms.each do |mterm|
  Medicalkeyword.create!(term: mterm)
end

puts "making practices"

medical_practices = [
  'Dermatology',
  'Pediatrics',
  'Orthopedics',
  'Dentistry',
  'Physical Therapy',
  'Obstetrics and Gynecology',
  'Psychiatry',
  'Neurology',
  'Cardiology',
  'Ophthalmology',
  'Endocrinology',
  'Pulmonology',
  'Orthodontics',
  'Chiropractic',
  'Clinic',
  'cavity',
  'massage',
  'woman',
  'mental health',
  'emotional',
  'brain',
  'nerves',
  'heart',
  'glasses',
  'eyes',
  'hormones',
  'lungs'
]

medical_practices.each do |m_practice|
  new_practice = Practice.create!(name: m_practice, info: Faker::Lorem.sentence)
end

medical_keywords_for_practices = {
  "Dermatology" => ['Rash', 'Itching', 'Redness', 'Swelling', 'Dryness', 'Scaling', 'Blisters', 'skin', 'hair'],
  "Pediatrics" => ['Fever', 'Cough', 'Diarrhea', 'Vomiting', 'Fatigue', 'Abdominal pain', 'child'],
  "Orthopedics" => ['Stiffness', 'Limited range of motion', 'Pain', 'Weakness', 'Instability', 'Deformity', 'Numbness', 'Tingling', 'Difficulty walking', 'Joint stiffness', 'surgery', 'bones'],
  "Dentistry" => ['Toothache', 'Tooth sensitivity', 'Gum swelling', 'Bleeding gums', 'Bad breath', 'Tooth discoloration', 'Jaw pain', 'Loose teeth', 'Difficulty chewing', 'cavity'],
  "Physical Therapy" => ['Muscle weakness', 'Joint stiffness', 'Balance problems', 'Difficulty walking', 'Muscle spasms', 'Postural problems', 'Functional limitations', 'massage'],
  "Obstetrics and Gynecology" => ['Menstrual irregularities', 'Pelvic pain', 'Vaginal bleeding', 'Infertility', 'Sexual dysfunction', 'woman'],
  "Psychiatry" => ['Depression', 'Anxiety', 'Mood swings', 'Insomnia', 'Loss of interest', 'Changes in appetite', 'Irritability', 'Difficulty concentrating', 'Suicidal thoughts', 'mental health', 'emotional'],
  "Neurology" => ['Headache', 'Dizziness', 'Seizures', 'Tremors', 'Memory problems', 'Coordination difficulties', 'Speech difficulties', 'Vision changes', 'brain', 'nerves'],
  "Cardiology" => ['Chest pain', 'Shortness of breath', 'Palpitations', 'Edema', 'High blood pressure', 'Irregular heartbeat', 'Fainting', 'heart'],
  "Ophthalmology" => ['Blurred vision', 'Eye pain', 'Dry eyes', 'Eye discharge', 'Double vision', 'Flashes of light', 'Floaters in vision', 'Vision loss',
  'eyes', 'glasses'],
  "Endocrinology" => ['Weight changes', 'Mood swings', 'Hair loss', 'Irregular menstrual periods', 'Excessive thirst', 'Increased urination', 'Temperature intolerance', 'Changes in appetite', 'Low libido', 'hormones'],
  "Pulmonology" => ['Shortness of breath', 'Wheezing', 'Chest tightness', 'Sputum production', 'Chronic cough', 'Difficulty breathing', 'Chest pain', 'Respiratory infections', 'lungs'],
  "Orthodontics" => ['Braces', 'Invisalign', 'Retainer', 'Overbite', 'Underbite', 'Crossbite', 'Crowding', 'Gaps between teeth'],
  "Chiropractic" => ['Spinal adjustment', 'Back pain', 'Neck pain', 'Joint pain', 'Muscle stiffness', 'Tingling', 'Sciatica', 'Leg pain or cramping'],
  "Clinic" => ['Family doctor', 'General physician', 'Nausea', 'Routine check-ups', 'Common illness']
}

puts "making practice keywords..."
medical_keywords_for_practices.each do |practice_name, keywords|
  practice = Practice.find_by(name: practice_name)
  keywords.each do |keyword|
    medical_keyword = Medicalkeyword.find_by(term: keyword)
    Practicekeyword.create(practice: practice, medicalkeyword: medical_keyword)
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

puts "matching institutions to practices"
Institution.all.each do |inst|
  Institutionspractice.create(institution: inst, practice: Practice.all.sample)
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

medical_practices[0].photo.attach(
  filename: 'dermatology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684829234/dermatology_fecws9.png')
)

# medical_practices[1].photo.attach(
#   filename: 'pediatrics',
#   io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684829233/pediatrics_g6mldn.png')
# )

# medical_practices[2].photo.attach(
#   filename: 'orthopedics',
#   io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684829233/orthopedics_vebswn.png')
# )

# medical_practices[3].photo.attach(
#   filename: 'Dermatology',
#   io: URI.open('')
# )

# medical_practices[4].photo.attach(
#   filename: 'Dermatology',
#   io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684829234/dermatology_fecws9.png')
# # )

# medical_practices.each do |practice|
#   @practice = Practice.find_by(name: practice)
#    p "debug#{@practice}"
#    binding.pry
#   @practice.photo.attach(
#     filename: practice,
#     io: File.open("app/assets/images/#{practice.downcase}.png")
# )
# @practice.save
# end
