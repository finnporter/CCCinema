require '../db/sql_runner'

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price'].to_f.round(2)
    @id = options['id'].to_i
  end
  
  
end