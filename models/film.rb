require_relative '../db/sql_runner'

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price'].to_f.round(2)
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', #{ @price }) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films SET (title, price) = ('#{ @title }', #{ @price}) WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers
      INNER JOIN tickets
      ON tickets.customer_id = customers.id
      INNER JOIN films
      ON films.id = tickets.film_id
      WHERE tickets.film_id = #{@id}"
    customer_hashes = SqlRunner.run(sql)
    result = customer_hashes.map { |customer_hash| Customer.new(customer_hash)  }
  end

  def self.all
    sql = "SELECT * FROM films"
    film_hashes = SqlRunner.run(sql)
    result = film_hashes.map { |film_hash| Film.new(film_hash)  }
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  
  
end