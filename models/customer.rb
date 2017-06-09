require_relative '../db/sql_runner'

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_f.round(2)
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', #{ @funds }) RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ('#{ @name }', #{ @funds}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films
    sql = "SELECT films.* FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      INNER JOIN customers
      ON customers.id = tickets.customer_id
      WHERE tickets.customer_id = #{@id}"
      film_hashes = SqlRunner.run(sql)
      result = film_hashes.map { |film_hash| Film.new(film_hash)  }
      return result
  end

  def self.all
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    result = customer_hashes.map { |customer_hash| Customer.new(customer_hash)  }
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
  
  
end