puts "==========================="
puts "Destroying seed !!!"
puts "==========================="
User.destroy_all
Cour.destroy_all
CoursUser.destroy_all
puts "==========================="
puts "Seed destroyed !!!"
puts "==========================="


puts "==========================="
puts "Creating Users"
puts "==========================="

user1 = User.new(username:"Lucas", status:"Admin", password:"azerty", level:"All")
user2 = User.new(username:"olili", status:"Elève", level:"2nd", password:"azerty")
user3 = User.new(username:"bibi", status:"Elève", level:"Terminale", password:"azerty")
user4 = User.new(username:"ben", status:"Prof", level:"All", password:"azerty")

user1.save!
# user2.save!
# user3.save!
# user4.save!

# puts "==========================="
# puts "Creating Cours"
# puts "==========================="

# cours1 = Cour.new(name:"Chapitre 1 : la guerre", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Histoire", level:"2nd")
# cours1.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours1.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours1.save!

# cours2 = Cour.new(name:"Chapitre 2 : l'amour", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Histoire", level:"Terminale")
# cours2.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours2.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours2.save!

# cours3 = Cour.new(name:"Chapitre 1 : les déserts", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"Géographie", level:"2nd")
# cours3.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours3.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours3.save!

# cours4 = Cour.new(name:"Chapitre 10 : React", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"EMC", level:"2nd")
# cours4.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours4.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours4.save!

# cours5 = Cour.new(name:"Chapitre 12 : JS", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"EMC", level:"2nd")
# cours5.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours5.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours5.save!

# cours6 = Cour.new(name:"Chapitre 11 : Rails", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore blanditiis optio iure vero labore, reiciendis voluptate ducimus impedit, porro deleniti, eum recusandae ad incidunt ratione facilis, qui repellendus ipsa et.", category:"EMC", level:"2nd")
# cours6.file = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/Cours-1A_SIx2.pdf").open
# cours6.img = Pathname.new("#{Rails.root}/public/uploads/cour/file/4/books.jpg").open
# cours6.save!

# puts "==========================="
# puts "Creating CoursUser"
# puts "==========================="

# cours_user1 = CoursUser.new(user: user2, cour: cours3)
# cours_user2 = CoursUser.new(user: user2, cour: cours1)
# cours_user3 = CoursUser.new(user: user3, cour: cours2)

# cours_user1.save!
# cours_user2.save!
# cours_user3.save!

puts "==========================="
puts "OK OK OK !!!"
puts "==========================="
