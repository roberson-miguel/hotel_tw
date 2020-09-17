# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_17_163141) do

  create_table "hotels", force: :cascade do |t|
    t.string "nome"
    t.integer "classe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.string "periodo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.string "date_starting"
    t.string "date_exit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tipo_cliente_id", null: false
    t.index ["tipo_cliente_id"], name: "index_reservas_on_tipo_cliente_id"
  end

  create_table "tabela_precos", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "tipo_cliente_id", null: false
    t.integer "periodo_id", null: false
    t.float "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_tabela_precos_on_hotel_id"
    t.index ["periodo_id"], name: "index_tabela_precos_on_periodo_id"
    t.index ["tipo_cliente_id"], name: "index_tabela_precos_on_tipo_cliente_id"
  end

  create_table "tipo_clientes", force: :cascade do |t|
    t.string "type_client"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservas", "tipo_clientes"
  add_foreign_key "tabela_precos", "hotels"
  add_foreign_key "tabela_precos", "periodos"
  add_foreign_key "tabela_precos", "tipo_clientes"
end
