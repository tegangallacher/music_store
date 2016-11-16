require ('pg')
require_relative('../db/SqlRunner')
require_relative('artist')
require_relative('song')
class Album

  attr_accessor :title, :genre, :artist_id, :price
  attr_reader :id

  def initialize (options)
    @title = options["title"]
    @id = options["id"].to_i if options["id"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
    @price = options["price"].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre, artist_id, price) VALUES ('#{@title}', '#{@genre}', #{artist_id}, #{@price}) returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map{|hash|Album.new(hash)}
  end

  def update
    return unless @id
    sql = "UPDATE albums SET
    (title, genre, artist_id, price) = 
    ('#{@title}', '#{@genre}', #{artist_id}, #{@price})
    WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def delete()
    return unless @id
    sql = "DELETE FROM albums WHERE id = #{id};"
    result = SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM albums;"
    result = SqlRunner.run(sql)
  end

  def artist() 
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    artist = Artist.new(result[0])
    return artist
  end 

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return result.map{|hash|Album.new(hash)}
  end

  def self.total_price
    sql = "SELECT SUM(price) FROM albums;"
    result = SqlRunner.run(sql)
    @sum = result[0]['sum'].to_i
  end


end