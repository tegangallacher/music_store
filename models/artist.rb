require ('pg')
require_relative('../db/SqlRunner')
require_relative('album')
require_relative('song')
class Artist

attr_accessor :name
attr_reader :id

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

def save
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def update
  return unless @id
  sql = "UPDATE artists SET
        (name) = 
        ('#{@name}')
        WHERE id = #{@id};"
  result = SqlRunner.run(sql)
end

def delete()
  return unless @id
  sql = "DELETE FROM artists WHERE id = #{id};"
  result = SqlRunner.run(sql)
end

def self.all
  sql = "SELECT * FROM artists;"
  result = SqlRunner.run(sql)
  return result.map{|hash|Artist.new(hash)}
end

def self.delete_all
  sql = "DELETE FROM artists;"
  result = SqlRunner.run(sql)
end

def album()
  sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  album = SqlRunner.run(sql)
  result = album.map{|hash|Album.new(hash)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM artists WHERE id = #{id};"
  result = SqlRunner.run(sql)
  return result.map{|hash|Artist.new(hash)}

end



end