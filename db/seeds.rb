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

Admin.create(
	username: "admin",
	password_digest: "admin"
)

Guru.create(
	username: "nurfi29",
	password_digest: "12345678nine",
	nama: "Nurfi Agnia",
	nip: "2017301129011997",
	jk: "Wanita",
	ttl: "1997-01-29",
	alamat: "Cirebon",
	no_tlp: "08787878999",
	mapel: "Khat",
	pendidikan: "MTs"
)