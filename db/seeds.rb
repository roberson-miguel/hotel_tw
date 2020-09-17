# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type_cliente1 = TipoCliente.create(type_client: "Regular")
type_cliente2 = TipoCliente.create(type_client: "Fidelidade")

periodo1 = Periodo.create(periodo: "Semana")
periodo2 = Periodo.create(periodo: "Fim de semana")

Hotel1 = Hotel.create(nome: "Parque das flores", classe: 3)
Hotel2 = Hotel.create(nome: "Jardim Botânico", classe: 4)
Hotel3 = Hotel.create(nome: "Mar Atlântico", classe: 5)