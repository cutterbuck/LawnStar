# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlayerGame.destroy_all
Player.destroy_all
Game.destroy_all
Sport.destroy_all
League.destroy_all



# PlayerGame.all.each do |s|
#   s.destroy
# end
# Player.all.each do |s|
#   s.destroy
# end
# Game.all.each do |s|
#   s.destroy
# end
# Sport.all.each do |s|
#   s.destroy
# end


league = League.create(name: "Always Sunny")


mac = Player.create(name: "Mac", league: league, password: "a", password_confirmation: "a")
dennis = Player.create(name: "Dennis", league: league, password: "a", password_confirmation: "a")
dee = Player.create(name: "Dee", league: league, password: "a", password_confirmation: "a")
frank = Player.create(name: "Frank", league: league, password: "a", password_confirmation: "a")
charlie = Player.create(name: "Charlie", league: league, password: "a", password_confirmation: "a")

cornhole = Sport.create(name: "Cornhole", rules: "Win by scoring 21 points exactly. Each player takes turns throwing their bags(4 total) at the board, on the board is 1 point. In the hole is 3 points. Aggregate points for that round or if you're playing cancels aggregate then subtract the lower score.")
horseshoes = Sport.create(name: "Horseshoes", rules: "Win by 21. Each person has 4 horseshoes, take turns tossing the horseshoe at the pole. Ringer is 3 points, within one horsheshoe length of pople is 1 point.")
fooseball = Sport.create(name: "Fooseball", rules: "Soccer but table form. First to 10 wins. Win by 2. No spins.")
washers = Sport.create(name: "Washer", rules: "3 points in the can, 1 in the box.")
camjam = Sport.create(name: "Cam Jam", rules: "In the slot is game over. Outside the can is 2, partner smacking frisbee into the can is 3, partner hitting the frisbee into the outside of the can is 1 point.")
