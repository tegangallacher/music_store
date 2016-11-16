require ('pg')
require_relative('../db/SqlRunner')
class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id

  def initialize (options)
    @title = options["title"]
    @id = options["id"].to_i if options["id"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

end