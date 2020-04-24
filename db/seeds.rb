puts "==========================="
puts "Destroying seed !!!"
puts "==========================="
User.destroy_all
puts "==========================="
puts "Seed destroyed !!!"
puts "==========================="


puts "==========================="
puts "Creating Users"
puts "==========================="

user1 = User.new(username:"Lucas", password:"azerty", status:"admin")

user1.save!


puts "==========================="
puts "OK OK OK !!!"
puts "==========================="
