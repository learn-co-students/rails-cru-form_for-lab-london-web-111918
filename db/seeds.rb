eminem = Artist.create(name: "Eminem", bio: "Real name is Marshel Mathers")
taylor_swift = Artist.create(name: "Taylor Swift", bio: "Has had too many boyfriends")
usher = Artist.create(name: "Usher", bio: "smooth af")

killshot = Song.create(name: "Killshot")
blank_space = Song.create(name: "Blank Space")
yeah = Song.create(name: "Yeah")

rap = Genre.create(name: "Rap")
pop = Genre.create(name: "Pop")
rnb = Genre.create(name: "RnB")

killshot.genre = rap
killshot.artist = eminem
killshot.save

blank_space.genre = pop
blank_space.artist = taylor_swift
blank_space.save

yeah.genre = rnb
yeah.artist = usher
yeah.save
