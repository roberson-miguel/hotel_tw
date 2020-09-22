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

TabelaPreco1 = TabelaPreco.create(hotel_id: 1, tipo_cliente_id: 1, periodo_id: 1, preco: 110 )
TabelaPreco2 = TabelaPreco.create(hotel_id: 2, tipo_cliente_id: 1, periodo_id: 1, preco: 160)
TabelaPreco3 = TabelaPreco.create(hotel_id: 3, tipo_cliente_id: 1, periodo_id: 1, preco: 220)

TabelaPreco4 = TabelaPreco.create(hotel_id: 1, tipo_cliente_id: 2, periodo_id: 1, preco: 80 )
TabelaPreco5 = TabelaPreco.create(hotel_id: 2, tipo_cliente_id: 2, periodo_id: 1, preco: 110)
TabelaPreco6 = TabelaPreco.create(hotel_id: 3, tipo_cliente_id: 2, periodo_id: 1, preco: 100)

TabelaPreco7 = TabelaPreco.create(hotel_id: 1, tipo_cliente_id: 1, periodo_id: 2, preco: 90)
TabelaPreco8 = TabelaPreco.create(hotel_id: 2, tipo_cliente_id: 1, periodo_id: 2, preco: 60)
TabelaPreco9 = TabelaPreco.create(hotel_id: 3, tipo_cliente_id: 1, periodo_id: 2, preco: 150)

TabelaPreco10 = TabelaPreco.create(hotel_id: 1, tipo_cliente_id: 2, periodo_id: 2, preco: 80)
TabelaPreco11 = TabelaPreco.create(hotel_id: 2, tipo_cliente_id: 2, periodo_id: 2, preco: 50)
TabelaPreco12 = TabelaPreco.create(hotel_id: 3, tipo_cliente_id: 2, periodo_id: 2, preco: 40)

Reserva1 = Reserva.create(tipo_cliente_id: 1, date_starting: "16Mar2020(mon)", date_exit: "18Mar2020(wed")
Reserva2 = Reserva.create(tipo_cliente_id: 1, date_starting: "20Mar2020(fri)", date_exit: "22Mar2020(sun")
Reserva3 = Reserva.create(tipo_cliente_id: 2, date_starting: "26Mar2020(thur)", date_exit: "28Mar2020(sat")