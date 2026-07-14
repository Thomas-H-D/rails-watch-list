# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
# db/seeds.rb
require "json"

puts "Clearing the local movies catalog..."
Movie.destroy_all

# 1. Take that exact text layout right off the documentation screen and save it as a raw Ruby string!
raw_json_sample = '{
  "results": [
    {
      "id": 238,
      "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
      "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
      "title": "The Godfather"
    },
    {
      "id": 278,
      "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
      "title": "The Shawshank Redemption"
    },
    {
      "id": 772071,
      "overview": "70-year-old Malena gets a second chance at life when she magically turns into her 22-year-old self. Now, posing as \"Maria\" to hide her true identity, she becomes the lead singer of her grandson\'s band and tries to recover her dream of singing, which she had to give up at some point.",
      "poster_path": "/6gIJuFHh5Lj4dNaPG3TzIMl7L68.jpg",
      "title": "Cuando Sea Joven"
    },
    {
      "id": 240,
      "overview": "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
      "poster_path": "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
      "title": "The Godfather Part II"
    },
    {
      "id": 424,
      "overview": "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
      "poster_path": "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
      "title": "Schindler\'s List"
    },
    {
      "id": 19404,
      "overview": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
      "poster_path": "/ktejodbcdCPXbMMdnpI9BUxW6O8.jpg",
      "title": "Dilwale Dulhania Le Jayenge"
    },
    {
      "id": 129,
      "overview": "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
      "poster_path": "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
      "title": "Spirited Away"
    },
    {
      "id": 389,
      "overview": "The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors\' prejudices and preconceptions about the trial, the accused, and each other.",
      "poster_path": "/ow3wq89wM8qd5X7hWKxiRfsFf9C.jpg",
      "title": "12 Angry Men"
    },
    {
      "id": 372058,
      "overview": "High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki\'s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other.",
      "poster_path": "/q719jXXEzOoYaps6babgKnONONX.jpg",
      "title": "Your Name"
    },
    {
      "id": 496243,
      "overview": "All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
      "poster_path": "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
      "title": "Parasite"
    },
    {
      "id": 155,
      "overview": "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.",
      "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
      "title": "The Dark Knight"
    },
    {
      "id": 497,
      "overview": "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people\'s ailments. When the cell block\'s head guard, Paul Edgecomb, recognizes Coffey\'s miraculous gift, he tries desperately to help stave off the condemned man\'s execution.",
      "poster_path": "/o0lO84GI7qrG6XFvtsPOSV7CTNa.jpg",
      "title": "The Green Mile"
    },
    {
      "id": 995133,
      "overview": "The unlikely friendship of a boy, a mole, a fox and a horse traveling together in the boy\'s search for home.",
      "poster_path": "/oQRgyQCzcyZvE6w5heM9ktVY0LT.jpg",
      "title": "The Boy, the Mole, the Fox and the Horse"
    },
    {
      "id": 680,
      "overview": "A burger-loving hit man, his philosophical partner, a drug-addled gangster\'s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.",
      "poster_path": "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
      "title": "Pulp Fiction"
    },
    {
      "id": 372754,
      "overview": "Rihito Sajo, an honor student with a perfect score on the entrance exam and Hikaru Kusakabe, in a band and popular among girls, would have never crossed paths. Until one day they started talking at the practice for their school\' upcoming chorus festival. After school, the two meet regularly, as Hikaru helps Rihito to improve his singing skills. While they listen to each other\'s voice and harmonize, their hearts start to beat together.",
      "poster_path": "/cIfRCA5wEvj9tApca4UDUagQEiM.jpg",
      "title": "Dou kyu sei Classmates"
    },
    {
      "id": 429,
      "overview": "While the Civil War rages on between the Union and the Confederacy, three men - a quiet loner, a ruthless hitman, and a Mexican bandit - comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.",
      "poster_path": "/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg",
      "title": "The Good, the Bad and the Ugly"
    },
    {
      "id": 13,
      "overview": "A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.",
      "poster_path": "/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg",
      "title": "Forrest Gump"
    },
    {
      "id": 704264,
      "overview": "Genndy Tartakovsky\'s Primal: Tales of Savagery features a caveman and a dinosaur on the brink of extinction. Bonded by tragedy, this unlikely friendship becomes the only hope of survival.",
      "poster_path": "/9NBBkdxH0TjQEBSN2AzeE1sgsF9.jpg",
      "title": "Primal: Tales of Savagery"
    },
    {
      "id": 122,
      "overview": "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron\'s forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord\'s realm.",
      "poster_path": "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
      "title": "The Lord of the Rings: The Return of the King"
    },
    {
      "id": 769,
      "overview": "The true story of Henry Hill, a half-Irish, half-Sicilian Brooklyn kid who is adopted by neighbourhood gangsters at an early age and climbs the ranks of a Mafia family under the guidance of Jimmy Conway.",
      "poster_path": "/aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg",
      "title": "GoodFellas"
    }
  ]
}'

puts "Parsing our local mock data payload tray..."

# 2. Use the translation tool.
movie_data = JSON.parse(raw_json_sample)
movies_array = movie_data["results"]

# 3. Loop through and build your database records exactly like a live API synchronization script
movies_array.each do |movie_hash|
  puts "Seeding film record: #{movie_hash['title']}"

  Movie.create!(
    title: movie_hash["title"],
    overview: movie_hash["overview"],
    poster_url: movie_hash["poster_path"]
  )
end

puts "Successfully seeded #{Movie.count} premium movies from the TMDB documentation sample!"
