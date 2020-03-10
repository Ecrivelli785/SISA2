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

ActiveRecord::Schema.define(version: 2020_03_10_122816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificados", force: :cascade do |t|
    t.integer "nro_certificado"
    t.date "fecha_aplicacion"
    t.date "fecha_vencimiento"
    t.time "hora_aplicacion"
    t.string "tratamiento"
    t.string "vector"
    t.string "superficie"
    t.string "droga"
    t.string "codigo"
    t.string "observaciones_certificado"
    t.boolean "estado"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_certificados_on_cliente_id"
    t.index ["nro_certificado"], name: "index_certificados_on_nro_certificado"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "apellido"
    t.string "nombre"
    t.string "domicilio"
    t.string "celular"
    t.string "telefono"
    t.boolean "estado"
    t.boolean "estado_mkt"
    t.string "cuit"
    t.string "correo"
    t.string "observaciones_cliente"
    t.string "rubro"
    t.string "cliente_tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quejas", force: :cascade do |t|
    t.date "fecha_queja"
    t.string "observacion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cliente_id", null: false
    t.bigint "certificado_id", null: false
    t.boolean "estado"
    t.integer "nro_queja"
    t.index ["certificado_id"], name: "index_quejas_on_certificado_id"
    t.index ["cliente_id"], name: "index_quejas_on_cliente_id"
  end

  create_table "tecnicos", force: :cascade do |t|
    t.bigint "dni"
    t.string "apellido"
    t.string "nombre"
    t.string "domicilio"
    t.string "observaciones_tecnico"
    t.string "telefono"
    t.boolean "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "certificados", "clientes"
  add_foreign_key "quejas", "certificados"
  add_foreign_key "quejas", "clientes"
end
