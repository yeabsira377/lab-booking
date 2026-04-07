require_relative "user"
require_relative "resource"
require_relative "booking"

# Users
user1 = User.new(id: 1, name: "Alice", role: "student")
user2 = User.new(id: 2, name: "Bob", role: "assistant")

# Resources
resource1 = Resource.new(id: 1, name: "Projector", category: "electronics")
resource2 = Resource.new(id: 2, name: "Microscope", category: "lab")

# Valid booking
booking1 = Booking.new(user: user1, resource: resource1)
puts "Booking1 created"

# Try conflicting booking
begin
  booking2 = Booking.new(user: user2, resource: resource1)
rescue => e
  puts "Error: #{e.message}"
end

# Cancel booking
booking1.cancel
puts "Booking1 cancelled"

# Try again
booking3 = Booking.new(user: user2, resource: resource1)
puts "Booking3 created after cancellation"