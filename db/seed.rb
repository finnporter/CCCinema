require 'pry-byebug'
require '../models/customer'
require '../models/film'
require '../models/ticket'

customer_01 = Customer.new( { 'name' => 'Vic', 'funds' => 22 } )
customer_02 = Customer.new( { 'name' => 'Eugene', 'funds' => 19 } )

film_01 = Film.new( { 'title' => 'Wonder Woman', 'price' => 5 } )
film_02 = Film.new( { 'title' => 'Toy Story', 'price' => 10 } )

ticket_01 = Ticket.new( { 'customer_id' => customer_01.id, 'film_id' => film_01.id } )
ticket_02 = Ticket.new( { 'customer_id' => customer_02.id, 'film_id' => film_02.id } )

binding.pry
nil