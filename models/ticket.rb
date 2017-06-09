require_relative '../db/sql_runner'

class Ticket

  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{ @customer_id }', #{ @film_id }) RETURNING id"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets"
    ticket_hashes = SqlRunner.run(sql)
    result = ticket_hashes.map { |ticket_hash| Ticket.new(ticket_hash)  }
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end
  
  
end