require ('pg')
require_relative('../db/SqlRunner')
require_relative('album')
require_relative('artist')
class Song

attr_accessor :song, :album_id
attr_reader :id

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @song = options["song"]
    @album_id = options["album_id"].to_i
  end

  def save
    sql = "INSERT INTO songs (song, album_id) VALUES ('#{@song}', #{album_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM songs;"
    result = SqlRunner.run(sql)
    return result.map{|hash|Song.new(hash)}
  end

  def update
    return unless @id
    sql = "UPDATE songs SET
    (song, album_id) = 
    ('#{@song}', #{album_id})
    WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def delete()
    return unless @id
    sql = "DELETE FROM songs WHERE id = #{id};"
    result = SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM songs;"
    result = SqlRunner.run(sql)
  end 

  def self.find(id)
    sql = "SELECT * FROM songs WHERE id = #{id};"
    result = SqlRunner.run(sql)
    return result.map{|hash|Song.new(hash)}
  end
end