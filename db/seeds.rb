puts "==========================="
puts "Destroying seed !!!"
puts "==========================="
User.destroy_all
Cour.destroy_all
puts "==========================="
puts "Seed destroyed !!!"
puts "==========================="


puts "==========================="
puts "Creating Users"
puts "==========================="

user1 = User.new(username:"Lucas", status:"Admin", password:"azerty")

user1.save!

puts "==========================="
puts "Creating Cours"
puts "==========================="

cours1 = Cour.new(name:"Chapitre 1 : la guerre", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Histoire")

cours2 = Cour.new(name:"Chapitre 2 : l'amour", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Histoire")

cours3 = Cour.new(name:"Chapitre 1 : les déserts", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Géographie")

cours1.save!
cours2.save!
cours3.save!

puts "==========================="
puts "OK OK OK !!!"
puts "==========================="
