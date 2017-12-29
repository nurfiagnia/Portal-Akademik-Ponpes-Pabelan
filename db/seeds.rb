# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Kontak.destroy_all

kontak = []

first_contact= {
	email: "supportpabelan@gmail.com",
	tlp: "(0293) 782040",
	pengasuhan: "0877-7007-1144 / 0822-2514-5745",
	kmi: "(0293)  782061",
	ma: "(0293) 3285188",
	sikpb: "(0293) 3301645"
}

kontak.push(first_contact)

Kontak.create(kontak)

User.destroy_all

user = []

first_user = {
	username: "admin",
	password: "admin",
}

user.push( first_user )

User.create(user)

Admin.destroy_all

Admin.create(
	username: "admin",
	password: "admin"
)

Tahunajaran.destroy_all

Tahunajaran.create(tahun: "#{DateTime.now.strftime "%Y"}/#{(DateTime.now + 1.year).strftime "%Y"}")