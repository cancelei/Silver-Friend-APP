# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_21_214818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.integer "addressable_id"
    t.string "postal_code"
    t.string "street"
    t.string "neighborhood"
    t.string "number"
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_dim_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "dim_providers", force: :cascade do |t|
    t.text "description"
    t.boolean "documentation_approved"
    t.boolean "specific_service_qualified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dim_user_id"
    t.index ["dim_user_id"], name: "index_dim_providers_on_dim_user_id"
  end

  create_table "dim_services", force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.string "name"
    t.text "description"
    t.integer "estimated_duration"
    t.decimal "price", precision: 10, scale: 2
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_dim_services_on_provider_id"
  end

  create_table "dim_users", force: :cascade do |t|
    t.string "cpf", limit: 11
    t.string "name"
    t.string "email"
    t.date "birth_date"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_dim_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_dim_users_on_reset_password_token", unique: true
  end

  create_table "fact_appointments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "service_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.string "status"
    t.decimal "amount_paid", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_fact_appointments_on_provider_id"
    t.index ["service_id"], name: "index_fact_appointments_on_service_id"
    t.index ["user_id"], name: "index_fact_appointments_on_user_id"
  end

  add_foreign_key "dim_providers", "dim_users"
  add_foreign_key "dim_services", "dim_providers", column: "provider_id"
  add_foreign_key "fact_appointments", "dim_providers", column: "provider_id"
  add_foreign_key "fact_appointments", "dim_services", column: "service_id"
  add_foreign_key "fact_appointments", "dim_users", column: "user_id"
end
