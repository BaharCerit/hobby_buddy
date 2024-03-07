# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

require "faker"
Message.destroy_all
Chatroom.destroy_all
Match.destroy_all
UserInterest.destroy_all
Interest.destroy_all
User.destroy_all


puts "create interests..."

Interest.create(name: "Swimming")
Interest.create(name: "Travel")
Interest.create(name: "Music")
Interest.create(name: "Dancing")
Interest.create(name: "Fitness")
Interest.create(name: "Nail polish party")
Interest.create(name: "Hiking")
Interest.create(name: "Cycling")
Interest.create(name: "Camping")
Interest.create(name: "Fishing")
Interest.create(name: "Photography")
Interest.create(name: "Climbing")
Interest.create(name: "Soccer")
Interest.create(name: "Basketball")
Interest.create(name: "Skating")
Interest.create(name: "Snowboarding")

puts "create users..."

user_1 = User.create(user_name: "Dogus Akyuz" ,address: "Utrecht", email: "dogus@gmail.com", password: "123456", description: "I have been working as a lawyer since 2010. In addition, after working as Lawyer and Managing Attorney at various law offices, I also worked as a Corporate Lawyer, Legal Counsel and Compliance Officer. Due to my wife's job, we moved to the Netherlands and I decided to change my career and start all-over again as a web developer." )
user_2 = User.create(user_name: "Jackie Almeida" ,address: "Amsterdam", email: "jaqueline@gmail.com", password: "123456", description: "I have been living in Ireland for the last two years working in healthcare, but I graduated in Audiovisual, I worked as a photographer for 1 year in Sao Paulo. I really love it, but I want to do it as a hobby, and after Le Wagon I hope to find a good opportunity to work in tech :)" )
user_3 = User.create(user_name: "Bahar Cerit" ,address: "Pumerand", email: "bahar@gmail.com", password: "123456", description: "I worked as an Occupational Therapist in Turkey for more than 6 years. I completed my training in Sensory Integration Therapy for disabled children and specialized in this field. I moved to the Netherlands 2 years ago and improved my Dutch to B1 level here. I want to learn code and become a web developer because my husband and many of my friends work in this industry. This field has started to interest me and I want to improve myself in this technology industry. I decided to plan a new career for myself in the technology industry. After completing my education in this field, I plan to become an intern in a company, improve myself further, learn more, and then start working as a web developer in a company." )
user_4 = User.create(user_name: "Allison Chen" ,address: "Amsterdam", email: "allison@gmail.com", password: "123456", description: "Allison Chen" )
user_5 = User.create(user_name: "Rob Ferrara" ,address: "Zandaam", email: "rob@gmail.com", password: "123456", description: "I'm Rob , an italian expat based in the netherlands for the past decade. I've been many things, Restaurant manager, Chef , coffee shop dealer, Tech store manager and more . I have chosen leWagon with a career change in mind hopefully i can make my dream of becoming a digital nomad a reality starting here!" )
user_6 = User.create(user_name: "Shlomi Fogel" ,address: "amsterdam", email: "shlomi@gmail.com", password: "123456", description: "I worked as a baker for 16 years, and I am looking to change my career to software development. I graduated high school in computer science, I studied algorithm concept, automates, and languages such as Pascal, visual basic, Html, Css and Javascript, i even created a small website and app to mange a Chinese medicine clinic. when the time to choose a profession i chose to go the baking school. i always had in my mind that i want to work as a coder so last year i tried the full stack engineer course on Codecademy, to see if i still find it interesting. and I really enjoyed, but realized that I need more guidance and opportunity to work in teams." )
user_7 = User.create(user_name: "Janis-Jekabs Ivdris  " ,address: "Riga", email: "janis@gmail.com", password: "123456", description: "Recently I have finished university and got my bachelor's degree in computer science. My previous work experience mostly consists of work as network engineer, but I have done some coding. I want to become the best full-stack software engineer I can." )
user_8 = User.create(user_name: "Heiðdís Birta" ,address: "amsterdam", email: "heidis@gmail.com", password: "123456", description: "I was working in customer service when I decided to change my career and try new things! I chose this course because I have people around me working in that field and I wanted to give it a go!" )
user_9 = User.create(user_name: "Kristofers Kaprāns" ,address: "riga", email: "kristofers@gmail.com", password: "123456", description: "I'm a software developer from Latvia, Riga. I've been working with backend services for 3 years as a system engineer and a programmer. I also have a bachelors degree in Information Technology from Riga Technical University. My plan is to develop myself as a skilled full-stack developer!" )
user_10 = User.create(user_name: "Sema Karan" ,address: "diemen", email: "sema@gmail.com", password: "123456", description: "I'm a data scientist with ~7 years of experience in companies like Booking.com, Ikea and Spotify. I decided to switch my career into engineering because I realized I like building things from scratch, and coding in general." )
user_11 = User.create(user_name: "Anna Karsten" ,address: "zeeland", email: "annak@gmail.com", password: "123456", description: "I have a bachelor degree in Marketing and Communication and I did a Master in Business Administration. I have worked in real estate for the last year. I want to learn webdevelopment, because I want to enhance my oppertunities on the job market. I am interested in the digital world and I think it will fit well with my degrees.")
user_12 = User.create(user_name: "Maiia Kuzmina" ,address: "amstelven", email: "maiia@gmail.com", password: "123456", description: "Before I was working as a customer service coordinator and recently tried coding. Never thought this is something for me and web development can be a fun career. Now it's time for a career switch. After Le Wagon I'm planning to work as a full stack developer.")
user_13 = User.create(user_name: "Neve Pancic" ,address: "amsterdam", email: "neve@gmail.com", password: "123456", description: "Heyooo, I am Neve, a tiny girl originally from Belgrade, Serbia! I moved to Amsterdam two years ago where I obtained my second master degree in Environment and Resource Management, followed by my first master degree in Environmental Policy and bachelors in Biology. But yeah, its the field of life science, true, but I couldnt find a job to support my life in it, so I decided to start all over agian with something new, interesting and fun in a hope I will manage to be the most creative sustainable Web Developer! Looking forward to start this journey with all of you!" )
user_14 = User.create(user_name: "David Ponte" ,address: "friesland", email: "david@gmail.com", password: "123456", description: "I've been a cook since I was 18yo and worked in many restaurants from Lisbon to London to Amsterdam. I have a big passion also for music having released an EP and continuing to produce songs on a daily basis as my hobby. I seek growth and discomfort quite often and Le Wagon feels like a logical step in my life both for learning coding in of itself and for future entrepreneurial opportunities. Currently addicted to podcasts about science, philosophy and history." )
user_15 = User.create(user_name: "Lisa Pourier" ,address: "amsterdam", email: "lisa@gmail.com", password: "123456", description: "I want to learn to code to change my life 😀. I started my career as a Business Analyst and Project Manager ~10yrs ago, currently working in Tech B2B software as Process & Tools Lead. Look forward to moving into a Technical role post-bootcamp." )
user_16 = User.create(user_name: "Anna Putt" ,address: "london", email: "annap@gmail.com", password: "123456", description: "I am the City Manager of Le Wagon in London. I want to learn to code to develop my technical skills and continue up skilling in my job. Outside of work, I love to cycle, swim, and go to art galleries" )
user_17 = User.create(user_name: "Loes van Puijenbroek" ,address: "amersfort", email: "loes@gmail.com", password: "123456", description: "I'm switching careers after almost 10 years from legal counsel / attorney to frontend developer. Love running (marathons), music, reading (scifi/fantasy mainly).")
user_18 = User.create(user_name: "Romee Weltevreden" ,address: "amsterdam", email: "romee@gmail.com", password: "123456", description: "I have previous work experience as a Digital Process Consultant and RPA Developer, through which I realized my interest in building and creating things. During this time I did a few free coding courses before deciding to take the leap and look for a full-time coding course. I am interested in becoming a front-end/back-end/full-stack developer after this." )

[user_1, user_2, user_3, user_4, user_5, user_6, user_7, user_8, user_9, user_10, user_11, user_12, user_13, user_14, user_15, user_16, user_17, user_18].each do |attributes|
  user = User.new(attributes)
  file = URI.open("https://unsplash.com/s/photos/funny-profile")
  user.photo.attach(io: file, filename: "#{user.name}.png", content_type: "image/png")
  user.save
end

# 2.times do
#   UserInterest.create(user: new_user, interest: Interest.all.sample)
# end

Match.create(first_user: User.first, second_user: User.last, status: false)
Match.create(first_user: User.all[-2], second_user: User.all[2], status: false)
Match.create(first_user: User.all[15], second_user: User.all[17], status: true)

Chatroom.create(match: Match.last)

Message.create(content: "Hello!", chatroom: Chatroom.last, user: User.all[15])
Message.create(content: "Hi :)", chatroom: Chatroom.last, user: User.all[17])

puts "sucessfully created"
