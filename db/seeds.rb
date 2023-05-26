# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

Institutionspractice.destroy_all
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
  'Leg',
  'cramp',
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
  'bones',
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
  'lungs',
  'pregnancy',
  'pregnant',
  "acne",
  "flake",
  "bump",
  "Eczema",
  "newborn",
  "growth",
  "vaccination",
  "vaccine",
  "nutrition",
  "Immunization",
  "Sports",
  "strain",
  "Neck",
  "Shoulder",
  "body",
  "Knee",
  "Hip",
  "Ankle",
  "Sprains",
  "Tendonitis",
  "Rehabilitation",
  "injury",
  "sick",
  "cold",
  "flu",
  "stomach",
  "foot",
  "back",
  "covid",
  "covid-19",
  "coronavirus",
  "vertigo",
  "ear",
  "nose",
  "throat",
  "nasal",
  "drip",
  "sleep apnea",
  "swallow",
  "sinus",
  "Hearing",
  "Hearing Loss",
  "Tinnitus",
  "Hoarseness"
]

medical_terms.each do |mterm|
  Medicalkeyword.create!(term: mterm)
end

puts "making practices"

medical_practices = {
  'Dermatology': '皮膚科',
  'Pediatrics': '小児科',
  'Orthopedics': '整形外科',
  'Ear-Nose-Throat': '耳鼻科',
  'Dentistry': '歯科',
  'Physical Therapy': '理学療法',
  'OB-GYN': '産婦人科',
  'Psychiatry': '精神科',
  'Neurology': '神経内科',
  'Cardiology': '循環器内科',
  'Ophthalmology': '眼科',
  'Endocrinology': '内分泌',
  'Pulmonology': '呼吸器科',
  'Orthodontics': '歯列矯正',
  'Chiropractic': 'カイロプラクティック',
  'Internal Medicine': '内科'
}

practices_infos = {
  'Dermatology': 'Skin doctors are called hifuka (皮膚科) in Japanese. A lot of advertisements for such doctors seem to focus on making the skin look better: laser treatments to remove blemishes, age-defying creams, and so on. But you would also visit this doctor to check for more serious problems, such as skin cancers or worrisome blotches. Sorry to be so direct, but it’s true.',
  'Pediatrics': 'Shōnika (小児科) is the Japanese word for pediatrics, medicine that focuses on childhood illnesses. ',
  'Orthopedics': 'Orthopedic practices are known as seikei-geka (整形外科) in Japanese. Such physicians are all over the place in Japan. While some orthopedic surgeons might need to cut you open to fix your bones or muscles, many of these doctors offer less-invasive relief for muscle and soft tissue aches and injuries. ',
  'Dentistry': 'Unless you have a chronic illness, the doctor you will probably see more than all others is the dentist, known as shika (歯科) in Japan. Back in the US, I scheduled my dental cleanings twice a year, but here in Japan, such services happen every three months. Dentists here also seem to do a lot more than I am used to. All clinics here perform routine dental work, but some also offer orthodontic and oral surgery services, things that would be done by specialists back in America.',
  'Physical Therapy': 'Physiotherapy is a comprehensive health disciple offering assessment, treatment and ongoing management for a range of acute and chronic conditions and injuries. Physiotherapists specialise in the musculoskeletal and neural systems, utilising a range of techniques including joint mobilisations, massage, heat treatment, stretching and exercise programs to alleviate pain while addressing the underlying cause of your issue.',
  'OB-GYN': 'For women’s health, you visit a fujinka (婦人科), the name for a gynecologist. But if you are about to have a baby, check out an obstetrician, or sanka (産科), instead. And congratulations on your new baby! ',
  'Psychiatry': 'Doctors take time to listen to a new patient. For this reason weekday after 17:00 and weekend (Saturday, Sundays are generally closed) appointments are very difficult to take for a first time patient. Often a nurse or a psychologist take a pre-examination interview with a patient or they ask a patient to fill out a detailed questionnaire about the condition and run some paper psychological tests. Many of these services are Japanese only even if the doctor speaks some English –',
  'Neurology': 'Neurologists aim at treating mental, neurological, muscle diseases, and developmental disorders, and provide advanced pioneering medical care based on the research results and to disseminate good care throughout the country. ',
  'Cardiology': 'Cardiologists focus on hypertension, arrhythmia, heart failure, angina etc. They can also take care of patients who have head ache, allergic rhinitis, diabetes, and cold etc.',
  'Ophthalmology': 'The eyes are the window to the soul, and a Japanese ganka (眼科) is very good at checking your soul. In the US, you will typically seek out an optometrist when you want glasses, and an ophthalmologist when you are worried that something is really wrong with your eyes. In Japan, a ganka typically serves both communities, although I have seen eyeglass stores that have an in-house optometrist only.',
  'Endocrinology': 'Endocrinology & Diabetes Department specializes in diabetes and all other hormonal disorders such as thyroid diseases. Hormones are part of the endocrine system, series of glands that produce and secrete hormones that control many different bodily functions.',
  'Pulmonology': 'They diagnose and treat acute and chronic respiratory problems, including Asthma, Chronic Respiratory Failure/Insufficiency. They also treat sleep related respiratory Disorders.',
  'Orthodontics': 'Orthodontic treatment is a creative discipline in medicine that addresses skeletal and functional irregularities in teeth alignment and occlusion by implementing corrective procedures to achieve a new morphological and functional balance, paying attention to each patient’s unique growth and developmental process. Due to these characteristics, orthodontics has been recognized and appreciated by individual citizens and society as one of the leading dental specialties that entail advanced expertise and skill.',
  'Chiropractic': ' Chiropractic is a natural, conservative, medication-free and non surgical form of health care that focuses on the relationship between the body’s structure, mainly the spine, and how it functions through the nervous system. Although chiropractors (practitioners) may use a variety of treatment approaches, they primarily perform spinal manipulations (adjustments) to correct misalignment of the spine. This is to improve function and support the body’s natural ability to heal itself.',
  'Internal Medicine': 'Your local catch-all physician is the naika (内科), an internal medicine professional, sometimes called an ippan-naika (一般内科). While some may argue that an internist is not the same as a general practitioner or family doctor, this nonetheless is the specialization you will look to for everyday care. Speaking of clinics, the term for that is kurinikku (クリニック), a word that applies to a broad range of medical offices. Your doctor might also work at a byōin (病院), that is, at a hospital.',
  'Ear-Nose-Throat': 'If you are looking for an ear, nose, and throat (ENT) doctor, search for the word jibi-inkōka (耳鼻咽喉科), sometimes shortened to just jibika (耳鼻科). Such clinics might also delve into pulmonary medicine. For instance, if you require a CPAP machine, you might pick one up from a Japanese ENT even though such devices focus on the lungs.'
}

puts "adding info"
medical_practices.each do |name, japanese_name|
  Practice.create!(name:, japanese_name:, info: practices_infos[name])
end

medical_keywords_for_practices = {
  "Dermatology" => ['Rash', 'Itching', 'Redness', 'Swelling', 'Dryness', 'Scaling', 'Blisters', 'skin', 'hair', "acne", "flake", "bump", "Eczema"],
  "Pediatrics" => ['Fever', 'Cough', 'Diarrhea', 'Vomiting', 'Fatigue', 'Abdominal pain', 'child', "newborn", "growth", "vaccination", "vaccine", "nutrition", "Immunization"],
  "Orthopedics" => ['Stiffness', 'Limited range of motion', 'Pain', 'Weakness', 'Instability', 'Deformity', 'Numbness', 'Tingling', 'Difficulty walking', 'Joint stiffness', 'surgery', 'bones'],
  "Dentistry" => ['Toothache', 'Tooth sensitivity', 'Gum swelling', 'Bleeding gums', 'Bad breath', 'Tooth discoloration', 'Jaw pain', 'Loose teeth', 'Difficulty chewing', 'cavity'],
  "Physical Therapy" => ['Muscle weakness', 'Joint stiffness', 'Balance problems', 'Difficulty walking', 'Muscle spasms', 'Postural problems', 'Functional limitations', 'massage', "Sports", "strain", "Neck", "Shoulder", "foot",
  "body", "Knee", "Hip", "Ankle", "Sprains", "Tendonitis", "Rehabilitation", "injury"],
  "OB-GYN" => ['Menstrual irregularities', 'Pelvic pain', 'Vaginal bleeding', 'Infertility', 'Sexual dysfunction', 'woman', 'pregnancy', 'pregnant'],
  "Psychiatry" => ['Depression', 'Anxiety', 'Mood swings', 'Insomnia', 'Loss of interest', 'Changes in appetite', 'Irritability', 'Difficulty concentrating', 'Suicidal thoughts', 'mental health', 'emotional'],
  "Neurology" => ['Headache', 'Dizziness', 'Seizures', 'Tremors', 'Memory problems', 'Coordination difficulties', 'Speech difficulties', 'Vision changes', 'brain', 'nerves'],
  "Cardiology" => ['Chest pain', 'Shortness of breath', 'Palpitations', 'Edema', 'High blood pressure', 'Irregular heartbeat', 'Fainting', 'heart'],
  "Ophthalmology" => ['Blurred vision', 'Eye pain', 'Dry eyes', 'Eye discharge', 'Double vision', 'Flashes of light', 'Floaters in vision', 'Vision loss','eyes', 'glasses'],
  "Endocrinology" => ['Weight changes', 'Mood swings', 'Hair loss', 'Irregular menstrual periods', 'Excessive thirst', 'Increased urination', 'Temperature intolerance', 'Changes in appetite', 'Low libido', 'hormones'],
  "Pulmonology" => ['Shortness of breath', 'Wheezing', 'Chest tightness', 'Sputum production', 'Chronic cough', 'Difficulty breathing', 'Chest pain', 'Respiratory infections', 'lungs', "covid", "covid-19", "coronavirus"],
  "Orthodontics" => ['Braces', 'Invisalign', 'Retainer', 'Overbite', 'Underbite', 'Crossbite', 'Crowding', 'Gaps between teeth'],
  "Chiropractic" => ['Spinal adjustment', 'Back pain', 'Neck pain', 'Joint pain', 'Muscle stiffness', 'Tingling', 'Sciatica', "cramp"],
  "Internal Medicine" => ['Family doctor', 'General physician', 'Nausea', 'Routine check-ups', 'Common illness', "vaccination", "vaccine", "cough", "sick", "cold", "flu", "stomach", "headache", "covid", "covid-19", "coronavirus"],
  "Ear-Nose-Throat" => ["vertigo", "ear", "nose", "throat", "nasal", "drip", "sleep apnea", "swallow", "sinus", "Hearing", "Hearing Loss", "Tinnitus", "Hoarseness"]
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

# Additional code for creating cards if needed
card = Card.new
card.user = User.first
card.practice = Practice.first
card.institution = Institution.first
card.originalcontent = Faker::Lorem.sentence
card.translatedcontent = "チョロン、彼のサブ男性デュオHongcunヘルプ、インターネットカフェ、卓球、オフにスケートだけでなく、工芸品や骨董品店に加えて、そこが店をオープンエアコン周辺堂堂巡りをすることができます。"
card.cardkeywords = "{ \n'keywords' => [\n{'Shortness of breath' => '息切れ, いきぎれ, ikigire'},\n{'Last week' => '先週, せんしゅう, senshuu'},\n{'Became' => 'なった, natta'}\n], \n'phrases' => [\n'息切れがします。 (I am experiencing shortness of breath.)',\n'先週から息切れがするようになりました。(I started experiencing shortness of breath since last week.)',\n'息切れがあるときは、胸が苦しくなります。(When I have shortness of breath, I feel chest tightness.)'\n]\n}"
card.save

# card2 = Card.new
# card2.user = User.first
# card2.practice = Practice.find_by(name: "Dentistry")
# card2.institution = Institution.last
# card2.originalcontent = "I've had a toothache for 3 days, and I'm worried I have a cavity"
# card2.translatedcontent = "3日前から歯が痛く、虫歯がないか心配です"
# card2.cardkeywords = "{\n  'keywords' => [\n    {'teeth'=>'歯, は, ha'},\n    {'pain'=>'痛い, いたい, itai'},\n    {'cavity'=>'虫歯, むしば, mushiba'}\n  ],\n  'phrases' => [\n    '歯が痛いです。虫歯があるかもしれません。(My teeth hurt. I'm worried I might have a cavity.)',\n    '3日前から歯が痛いです。(My teeth have been hurting for 3 days.)',\n    '虫歯がないか心配です。(I'm worried I might have a cavity.)'\n  ]\n}"
# card2.save


Practice.find_by(name: "Internal Medicine").photo.attach(
  filename: 'general_clinic',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849563/clinic.png')
)

Practice.find_by(name: "Dermatology").photo.attach(
  filename: 'dermatology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849561/dermatology.png')
)

Practice.find_by(name: "Dentistry").photo.attach(
  filename: 'dentistry',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849563/dentistry.png')
)

Practice.find_by(name: "Psychiatry").photo.attach(
  filename: 'psychiatry',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/psychiatry.png')
)

Practice.find_by(name: "Chiropractic").photo.attach(
  filename: 'chiropractic',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849563/chiropractic.png')
)

Practice.find_by(name: "Pediatrics").photo.attach(
  filename: 'pediatrics',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/pediatrics.png')
)

Practice.find_by(name: "Orthopedics").photo.attach(
  filename: 'orthopedics',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/orthopedics.png')
)

Practice.find_by(name: "Physical Therapy").photo.attach(
  filename: 'physical_therapy',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/phisical_therapy.png')
)

Practice.find_by(name: "OB-GYN").photo.attach(
  filename: 'ob-gyn',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/obstetrics_and_gynecology.png')
)

Practice.find_by(name: "Neurology").photo.attach(
  filename: 'neurology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849561/neurology.png')
)

Practice.find_by(name: "Cardiology").photo.attach(
  filename: 'cardiology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/cardiology.png')
)

Practice.find_by(name: "Ophthalmology").photo.attach(
  filename: 'ophthalmology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849561/ophthalmology.png')
)

Practice.find_by(name: "Endocrinology").photo.attach(
  filename: 'endocrinology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849561/endocrinology.png')
)

Practice.find_by(name: "Pulmonology").photo.attach(
  filename: 'pulmonology',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/pulmonology.png')
)

Practice.find_by(name: "Orthodontics").photo.attach(
  filename: 'orthodontics',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1684849562/orthodontics.png')
)

Practice.find_by(name: "Ear-Nose-Throat").photo.attach(
  filename: 'earnosethroat',
  io: URI.open('https://res.cloudinary.com/dozlu8kt0/image/upload/v1685066606/ear_nose_throat.png')
)
