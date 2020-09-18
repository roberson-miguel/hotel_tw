require "rails_helper"

feature 'User filling dates starting and finish of reserva' do
  scenario 'User filling date startin and date finish' do

    TipoCliente.create(type_client: "Regular")

    visit root_path
    click_link "Reservas"

    click_link "Nova Reserva"

   #fill_in("reserva_tipo_cliente_id", with: 'Regular')
    select "Regular", from: "reserva_tipo_cliente_id"
    fill_in "reserva_date_starting", with: "16Mar2020(mon)"
    fill_in "reserva_date_exit", with: "18Mar2020(wed)"

    click_button

    expect(page).to have_content("Detalhes da Reserva")
    expect(page).to have_content('Data de Entrada: 16Mar2020(mon)')
    expect(page).to have_content('Data de Saída: 18Mar2020(wed)')
    expect(page).to have_link('Voltar')
  end

end