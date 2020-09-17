require "rails_helper"

feature 'User filling dates starting and finish of reserva' do
  scenario 'User filling date startin and date finish' do

    visit root_path
    click_link "Reservas"

    click_link "Nova Reserva"

   #fill_in("reserva_tipo_cliente_id", with: 'Regular')
    find_field("reserva_tipo_cliente_id").set("Regular")
    find_field("reserva_date_starting").set("16Mar2020(mon)")
    find_field("reserva_date_exit").set("18Mar2020(wed)")

    click_button

    expect(page).to have_content("Detalhes da Reserva")
    expect(page).to have_content('Data de Entrada: 16Mar2020(mon)')
    expect(page).to have_content('Data de Saída: 18Mar2020(wed)')
    expect(page).to have_link('Voltar')
  end

end