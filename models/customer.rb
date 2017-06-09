require '../db/sql_runner'

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_f.round(2)
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{name}', #{funds}) RETURNING id"
    customer = SqlRunner.run(sql)
    @id = customer['id'].to_i
  end
  
  
end