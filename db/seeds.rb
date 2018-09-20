# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Country.connection.execute("ALTER TABLE countries AUTO_INCREMENT = 1")
Country.delete_all
p "Importing countries data to table."
Country.create(:id=>1,:code=>"IN",:name=>"India")

State.delete_all

State.create(:id=>1, :name=>"West Bengal",:country_id=>1)
State.create(:id=>2, :name=>"Uttar Pradesh",:country_id=>1)
State.create(:id=>3, :name=>"Tripura",:country_id=>1)
State.create(:id=>4, :name=>"Tamil Nādu",:country_id=>1)
State.create(:id=>5, :name=>"Sikkim",:country_id=>1)
State.create(:id=>6, :name=>"Rajasthan",:country_id=>1)
State.create(:id=>7, :name=>"Punjab",:country_id=>1)
State.create(:id=>8, :name=>"Pondicherry",:country_id=>1)
State.create(:id=>9, :name=>"Orissa",:country_id=>1)
State.create(:id=>10, :name=>"Nagaland",:country_id=>1)
State.create(:id=>11, :name=>"Mizoram",:country_id=>1)
State.create(:id=>12, :name=>"Meghalaya",:country_id=>1)
State.create(:id=>13, :name=>"Manipur",:country_id=>1)
State.create(:id=>14, :name=>"maharashtra",:country_id=>1)
State.create(:id=>15, :name=>"Madhya Pradesh",:country_id=>1)
State.create(:id=>16, :name=>"Laccadives",:country_id=>1)
State.create(:id=>17, :name=>"Kerala",:country_id=>1)
State.create(:id=>18, :name=>"Karnataka",:country_id=>1)
State.create(:id=>19, :name=>"Jammu and Kashmir",:country_id=>1)
State.create(:id=>20, :name=>"Himachal Pradesh",:country_id=>1)
State.create(:id=>21, :name=>"Haryana",:country_id=>1)
State.create(:id=>22, :name=>"Gujarāt",:country_id=>1)
State.create(:id=>23, :name=>"Daman and Diu",:country_id=>1)
State.create(:id=>24, :name=>"Goa",:country_id=>1)
State.create(:id=>25, :name=>"Delhi",:country_id=>1)
State.create(:id=>26, :name=>"Dadra and Nagar Haveli",:country_id=>1)
State.create(:id=>27, :name=>"Chandīgarh",:country_id=>1)
State.create(:id=>28, :name=>"Bihar",:country_id=>1)
State.create(:id=>29, :name=>"Assam",:country_id=>1)
State.create(:id=>30, :name=>"Arunachal Pradesh",:country_id=>1)
State.create(:id=>31, :name=>"Andhra Pradesh",:country_id=>1)
State.create(:id=>32, :name=>"Andaman and Nicobar Islands",:country_id=>1)
State.create(:id=>33, :name=>"Chhattisgarh",:country_id=>1)
State.create(:id=>34, :name=>"Jharkhand",:country_id=>1)
State.create(:id=>36, :name=>"Uttarakhand",:country_id=>1)
State.create(:id=>37)



City.delete_all
p "...................Importing city in database.................."
City.create(:name=>"Siliguri",:state_id=>1)
City.create(:name=>"Asansol",:state_id=>1)
City.create(:name=>"Kharagpur",:state_id=>1)
City.create(:name=>"Baharampur",:state_id=>1)
City.create(:name=>"Hugli-Chinsurah",:state_id=>1)
City.create(:name=>"Raiganj",:state_id=>1)
City.create(:name=>"Jalpaiguri",:state_id=>1)
City.create(:name=>"Habra",:state_id=>1)
City.create(:name=>"Ranaghat",:state_id=>1)
City.create(:name=>"Darjiling",:state_id=>1)
City.create(:name=>"Purulia",:state_id=>1)
City.create(:name=>"Murshidabad",:state_id=>1)
City.create(:name=>"Adra",:state_id=>1)
City.create(:name=>"Kolkata",:state_id=>1)


City.create(:name=>"Lucknow",:state_id=>2)
City.create(:name=>"Kanpur",:state_id=>2)
City.create(:name=>"Firozabad",:state_id=>2)
City.create(:name=>"Agra",:state_id=>2)
City.create(:name=>"Meerut",:state_id=>2)
City.create(:name=>"Varanasi",:state_id=>2)
City.create(:name=>"Allahabad",:state_id=>2)
City.create(:name=>"Moradabad",:state_id=>2)
City.create(:name=>"Aligarh",:state_id=>2)
City.create(:name=>"Saharanpur",:state_id=>2)
City.create(:name=>"Noida",:state_id=>2)
City.create(:name=>"Jhansi",:state_id=>2)
City.create(:name=>"Shahjahanpur",:state_id=>2)
City.create(:name=>"Modinagar",:state_id=>2)
City.create(:name=>"Hapur",:state_id=>2)
City.create(:name=>"Rae Bareli",:state_id=>2)
City.create(:name=>"Vrindavan",:state_id=>2)
City.create(:name=>"Mathura",:state_id=>2)
City.create(:name=>"Rudrapur",:state_id=>2)

City.create(:name=>"Agartala",:state_id=>3)
City.create(:name=>"Badharghat",:state_id=>3)
City.create(:name=>"Dharmanagar",:state_id=>3)
City.create(:name=>"Indranagar",:state_id=>3)
City.create(:name=>"Jogendranagar",:state_id=>3)
City.create(:name=>"Kailasahar",:state_id=>3)
City.create(:name=>"Khowai",:state_id=>3)
City.create(:name=>"Pratapgarh",:state_id=>3)
City.create(:name=>"Udaipur",:state_id=>3)



City.create(:name=>"Chennai",:state_id=>4)
City.create(:name=>"Coimbatore",:state_id=>4)
City.create(:name=>"Madurai",:state_id=>4)
City.create(:name=>"Tiruchirappalli",:state_id=>4)
City.create(:name=>"Tirunelveli",:state_id=>4)
City.create(:name=>"Ranipet",:state_id=>4)
City.create(:name=>"Vellore",:state_id=>4)
City.create(:name=>"Rameshwaram",:state_id=>4)
City.create(:name=>"Viswanatham",:state_id=>4)

City.create(:name=>"Gangtok",:state_id=>5)



City.create(:name=>"Jaipur",:state_id=>6)
City.create(:name=>"Jodhpur",:state_id=>6)
City.create(:name=>"Bikaner",:state_id=>6)
City.create(:name=>"Udaipur",:state_id=>6)
City.create(:name=>"Ajmer",:state_id=>6)
City.create(:name=>"Bhilwara",:state_id=>6)
City.create(:name=>"Alwar",:state_id=>6)
City.create(:name=>"Ratangarh",:state_id=>6)
City.create(:name=>"Mount Abu",:state_id=>6)


City.create(:name=>"Ludhiana",:state_id=>7)
City.create(:name=>"Patiala",:state_id=>7)
City.create(:name=>"Amritsar",:state_id=>7)
City.create(:name=>"Jalandhar",:state_id=>7)
City.create(:name=>"Bathinda",:state_id=>7)
City.create(:name=>"Pathankot",:state_id=>7)
City.create(:name=>"Mohali",:state_id=>7)
City.create(:name=>"Firozpur",:state_id=>7)
City.create(:name=>"Zirakpur",:state_id=>7)
City.create(:name=>"Fazilka",:state_id=>7)


City.create(:name=>"Pondicherry",:state_id=>8)
City.create(:name=>"Karaikal",:state_id=>8)


City.create(:name=>"Bhubaneswar",:state_id=>9)
City.create(:name=>"Cuttack",:state_id=>9)
City.create(:name=>"Raurkela",:state_id=>9)
City.create(:name=>"Puri",:state_id=>9)

City.create(:name=>"Dimapur",:state_id=>10)
City.create(:name=>"Kohima",:state_id=>10)
City.create(:name=>"Mokokchung",:state_id=>10)
City.create(:name=>"Tuensang",:state_id=>10)
City.create(:name=>"Wokha",:state_id=>10)
City.create(:name=>"Zunheboto",:state_id=>10)


City.create(:name=>"Aizawl",:state_id=>11)
City.create(:name=>"Champhai",:state_id=>11)
City.create(:name=>"Lunglei",:state_id=>11)
City.create(:name=>"Saiha",:state_id=>11)


City.create(:name=>"Jowai",:state_id=>12)
City.create(:name=>"Nongstoin",:state_id=>12)
City.create(:name=>"Shillong",:state_id=>12)
City.create(:name=>"Tura",:state_id=>12)

City.create(:name=>"Imphal",:state_id=>13)
City.create(:name=>"Kakching",:state_id=>13)
City.create(:name=>"Lilong",:state_id=>13)
City.create(:name=>"Mayang Imphal",:state_id=>13)
City.create(:name=>"Thoubal",:state_id=>13)

City.create(:name=>"Mumbai",:state_id=>14)
City.create(:name=>"Pune",:state_id=>14)
City.create(:name=>"Nagpur",:state_id=>14)
City.create(:name=>"Nashik",:state_id=>14)
City.create(:name=>"Lonavla",:state_id=>14)
City.create(:name=>"Shirdi",:state_id=>14)


City.create(:name=>"Indore",:state_id=>15)
City.create(:name=>"Bhopal",:state_id=>15)
City.create(:name=>"Jabalpur",:state_id=>15)
City.create(:name=>"Gwalior",:state_id=>15)
City.create(:name=>"Ujjain",:state_id=>15)

City.create(:name=>"Kochi",:state_id=>17)
City.create(:name=>"Thiruvananthapuram",:state_id=>17)
City.create(:name=>"Kozhikode",:state_id=>17)
City.create(:name=>"Kollam",:state_id=>17)
City.create(:name=>"Palakkad",:state_id=>17)


City.create(:name=>"Bengaluru",:state_id=>18)
City.create(:name=>"Mangaluru",:state_id=>18)
City.create(:name=>"Kolar",:state_id=>18)
City.create(:name=>"Udupi",:state_id=>18)
City.create(:name=>"Vijayapura",:state_id=>18)

City.create(:name=>"Srinagar",:state_id=>19)
City.create(:name=>"Jammu",:state_id=>19)
City.create(:name=>"Rajauri",:state_id=>19)
City.create(:name=>"Udhampur",:state_id=>19)


City.create(:name=>"Shimla",:state_id=>20)
City.create(:name=>"Mandi",:state_id=>20)
City.create(:name=>"Solan",:state_id=>20)
City.create(:name=>"Palampur",:state_id=>20)


City.create(:name=>"Faridabad",:state_id=>21)
City.create(:name=>"Gurgaon",:state_id=>21)
City.create(:name=>"Panchkula",:state_id=>21)
City.create(:name=>"Pinjore",:state_id=>21)


City.create(:name=>"Ahmedabad",:state_id=>22)
City.create(:name=>"Surat",:state_id=>22)
City.create(:name=>"Vadodara",:state_id=>22)
City.create(:name=>"Godhra",:state_id=>22)


City.create(:name=>"Panaji",:state_id=>1283)

City.create(:name=>"Goa",:state_id=>24)

City.create(:name => "Delhi", :state_id => 25)
City.create(:name => "Asola", :state_id => 25)

City.create(:name=>"Patna",:state_id=>28)
City.create(:name=>"Motihari",:state_id=>28)
City.create(:name=>"Bettiah",:state_id=>28)
City.create(:name=>"Muzaffarpur",:state_id=>28)
City.create(:name=>"Raxaul",:state_id=>28)
City.create(:name=>"Bhagalpur",:state_id=>28)

City.create(:name=>"Guwahati",:state_id=>29)
City.create(:name=>"Silchar",:state_id=>29)
City.create(:name=>"Dibrugarh",:state_id=>29)
City.create(:name=>"Tezpur",:state_id=>29)

City.create(:name=>"Naharlagun",:state_id=>30)
City.create(:name=>"Pasighat",:state_id=>30)


City.create(:name=>"Visakhapatnam",:state_id=>31)
City.create(:name=>"Vijayawada",:state_id=>31)
City.create(:name=>"Tirupati",:state_id=>31)
City.create(:name=>"Rajampet",:state_id=>31)
City.create(:name=>"Hyderabad",:state_id=>31)


City.create(:name=>"Dhanbad",:state_id=>34)
City.create(:name=>"Ranchi",:state_id=>34)
City.create(:name=>"Jamshedpur",:state_id=>34)
City.create(:name=>"Bokaro Steel City",:state_id=>34)


City.create(:name=>"Hardwar",:state_id=>36)
City.create(:name=>"Rishikesh",:state_id=>36)
City.create(:name=>"Nainital",:state_id=>36)
City.create(:name=>"Dehradun",:state_id=>36)
City.create(:name=>"Mussoorie",:state_id=>36)


User.delete_all
#Admin user create 
user = User.create(:email => "admin@example.com", :password => "password", :first_name => "admin", :phone => "9123456780")
user.add_role :admin


#Admin user create 
user = User.create(:email => "partner@example.com", :password => "password", :first_name => "Partner", :phone => "9123456780")
user.add_role :partner
user.create_portfolio

#normal user
user = User.create(:email => "user@example.com", :password => "password", :first_name => "rsys", :phone => "9123456780")
user.add_role :user

Status.delete_all

Status.create(id:1, name: "Pending")
Status.create(id:2, name: "Accepted")
Status.create(id:3, name: "Rejected")
Status.create(id:4, name: "Inprogress")
Status.create(id:5, name: "Cancelled")
Status.create(id:6, name: "Completed")
Status.create(id:7, name: "InCompleted")
Status.create(id:8, name: "Onhold")



TimeSlot.delete_all
TimeSlot.create(id:1, start_time: "00:00", end_time: "01:00")
TimeSlot.create(id:2, start_time: "01:00", end_time: "02:00")
TimeSlot.create(id:3, start_time: "02:00", end_time: "03:00")
TimeSlot.create(id:4, start_time: "03:00", end_time: "04:00")
TimeSlot.create(id:5, start_time: "04:00", end_time: "05:00")
TimeSlot.create(id:6, start_time: "05:00", end_time: "06:00")
TimeSlot.create(id:7, start_time: "06:00", end_time: "07:00")
TimeSlot.create(id:8, start_time: "07:00", end_time: "08:00")
TimeSlot.create(id:9, start_time: "08:00", end_time: "09:00")
TimeSlot.create(id:10, start_time: "09:00", end_time: "10:00")
TimeSlot.create(id:11, start_time: "10:00", end_time: "11:00")
TimeSlot.create(id:12, start_time: "11:00", end_time: "12:00")
TimeSlot.create(id:13, start_time: "12:00", end_time: "13:00")
TimeSlot.create(id:14, start_time: "13:00", end_time: "14:00")
TimeSlot.create(id:15, start_time: "14:00", end_time: "15:00")
TimeSlot.create(id:16, start_time: "15:00", end_time: "16:00")
TimeSlot.create(id:17, start_time: "16:00", end_time: "17:00")
TimeSlot.create(id:18, start_time: "17:00", end_time: "18:00")
TimeSlot.create(id:19, start_time: "18:00", end_time: "19:00")
TimeSlot.create(id:20, start_time: "19:00", end_time: "20:00")
TimeSlot.create(id:21, start_time: "20:00", end_time: "21:00")
TimeSlot.create(id:22, start_time: "21:00", end_time: "22:00")
TimeSlot.create(id:23, start_time: "22:00", end_time: "23:00")
TimeSlot.create(id:24, start_time: "23:00", end_time: "24:00")


