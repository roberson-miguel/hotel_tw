require "rails_helper"

feature 'User filling dates starting and finish of reserva' do
  scenario 'User filling date startin and date finish' do

    visit root_path
    click_link "Reservas"

    click_link "Nova Reserva"

    select "Regular", from: "reserva_tipo_cliente_id"
    fill_in "reserva_date_starting", with: "16Mar2020(mon)"
    fill_in "reserva_date_exit", with: "18Mar2020(wed)"

    click_button

    expect(page).to have_content("Reserva efetuada com sucesso!")
    expect(page).to have_content('Data de Entrada: 16Mar2020(mon)')
    expect(page).to have_content('Data de Saida: 18Mar2020(wed)')
    expect(page).to have_link('Voltar')
  end

end