require 'pry-byebug'
require_relative '../models/customer'
require_relative '../models/film'
require_relative '../models/ticket'

customer_01 = Customer.new( { 'name' => 'Vic', 'funds' => 22 } )
customer_02 = Customer.new( { 'name' => 'Eugene', 'funds' => 19 } )
customer_01.save
customer_02.save

film_01 = Film.new( { 'title' => 'Wonder Woman', 'price' => 5 } )
film_02 = Film.new( { 'title' => 'Toy Story', 'price' => 10 } )
film_01.save
film_02.save

ticket_01 = Ticket.new( { 'customer_id' => customer_01.id, 'film_id' => film_01.id } )
ticket_02 = Ticket.new( { 'customer_id' => customer_02.id, 'film_id' => film_02.id } )
ticket_01.save
ticket_02.save

binding.pry
nil