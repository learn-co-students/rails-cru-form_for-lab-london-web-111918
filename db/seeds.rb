# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Artists
Artist.destroy_all
eminem = Artist.create(name: "Eminem", bio: "American rapper, record producer and actor Eminem was born Marshall Bruce Mathers III on October 17, 1972, in St. Joseph, Missouri. He never knew his father, Marshall Mathers Jr., who abandoned the family when Eminem was still an infant and rebuffed all of his son's many attempts to contact him during his childhood.")
sade = Artist.create(name: "Sade", bio: "Helen Folasade Adu, CBE, known professionally as Sade Adu or simply Sade, is a British Nigerian singer, songwriter, and actress.")
skepta = Artist.create(name: "Skepta", bio: "Joseph Junior Adenuga, better known by his stage name Skepta, is an English rapper, songwriter, record producer and music video director from Tottenham, North London")
marvin_gaye = Artist.create(name: "Marvin Gaye", bio: "Marvin Pentz Gaye was an American singer, songwriter and record producer. Gaye helped to shape the sound of Motown in the 1960s, first as an in-house session player and later as a solo artist")

#Genres
Genre.destroy_all
soul = Genre.create(name: "Soul")
grime = Genre.create(name: "Grime")
rap = Genre.create(name: "Rap")

#Songs
Song.destroy_all
Song.create(name: "My Name Is", artist: eminem, genre: rap)
Song.create(name: "Lucky You", artist: eminem, genre: rap)
Song.create(name: "What's Going On?", artist: marvin_gaye, genre: soul)
Song.create(name: "Got To Give It Up", artist: marvin_gaye, genre: soul)
Song.create(name: "Pure Water", artist: skepta, genre: grime)
Song.create(name: "That's Not Me", artist: skepta, genre: grime)


# Song.create(name: "My name is", artist_id: 1, genre_id: 3)
# Song.create(name: "My name is", artist_id: eminem.id, genre_id: rap.id )
