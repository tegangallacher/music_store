require ('pry-byebug')
require_relative ('models/song')
require_relative ('models/album')
require_relative ('models/artist')
Song.delete_all()
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name"=>"Glass Animals"
  })
artist1.save()


artist2 = Artist.new({
  "name"=>"Kanye West"
  })
artist2.save()


album1 = Album.new({
  "title"=>"How To Be a Human Being",
  "genre"=>"Indie Rock",
  "artist_id"=> artist1.id,
  "price" => 10
  })
album1.save()

album2 = Album.new({
  "title"=>"Zaba",
  "genre"=>"Indie Rock",
  "artist_id"=> artist1.id,
  "price" => 8
  })
album2.save()

album3 = Album.new({
  "title"=>"The Life of Pablo",
  "genre"=>"Hip Hop",
  "artist_id"=> artist2.id,
  "price" => 10
  })
album3.save()

album4 = Album.new({
  "title"=>"Yeezus",
  "genre"=>"Hip Hop",
  "artist_id"=> artist2.id,
  "price" => 5
  })
album4.save()

song1 = Song.new({
  "song"=>"Famous",
  "album_id"=> album3.id
  })
song1.save

song2 = Song.new({
  "song"=>"Fade",
  "album_id"=> album3.id
  })
song2.save

song3 = Song.new({
  "song"=>"Black Skinhead",
  "album_id"=> album4.id
  })
song3.save

song4 = Song.new({
  "song"=>"Bound 2",
  "album_id"=> album4.id
  })
song4.save

song5 = Song.new({
  "song"=>"Life Itself",
  "album_id"=> album1.id
  })
song5.save
song6 = Song.new({
  "song"=>"Season 2 Episode 3",
  "album_id"=> album1.id
  })
song6.save
song7 = Song.new({
  "song"=>"Gooey",
  "album_id"=> album2.id
  })
song7.save
song8 = Song.new({
  "song"=>"Walla Walla",
  "album_id"=> album2.id
  })
song8.save
# artist1.name = "not U2"
# artist1.update()

# album1.genre = "classical"
# album1.update()

# album2.delete()
# artist2.delete()
# artist51 = Artist.find(51)

songs = Song.all()
artists = Artist.all()
albums = Album.all()
price = Album.total_price()


binding.pry
nil