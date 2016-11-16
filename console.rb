require ('pry-byebug')
require_relative ('models/album')
require_relative ('models/artist')
# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
  "name"=>"U2"
  })
artist1.save()


artist2 = Artist.new({
  "name"=>"The Beatles"
  })
artist2.save()


album1 = Album.new({
  "title"=>"The Joshua Tree",
  "genre"=>"Rock",
  "artist_id"=> artist1.id
  })
album1.save()

album2 = Album.new({
  "title"=>"How to Dismantle an Atomic Bomb",
  "genre"=>"Rock",
  "artist_id"=> artist1.id
  })
album2.save()

artist1.name = "not U2"
artist1.update()

album1.genre = "classical"
album1.update()

# album2.delete()
# artist2.delete()
artist51 = Artist.find(51)


artists = Artist.all()
albums = Album.all()

binding.pry
nil