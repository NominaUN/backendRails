# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170420010809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "area_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "concept_name", null: false
    t.string   "category",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "document_type",   null: false
    t.integer  "document_number", null: false
    t.string   "first_name",      null: false
    t.string   "other_name"
    t.string   "last_name",       null: false
    t.string   "second_surname"
    t.date     "birthdate",       null: false
    t.string   "birthplace",      null: false
    t.string   "address",         null: false
    t.string   "phones",          null: false
    t.string   "email",           null: false
    t.date     "admission_date",  null: false
    t.date     "retirement_date"
    t.decimal  "salary",          null: false
    t.boolean  "transport_aid",   null: false
    t.boolean  "integral_salary", null: false
    t.integer  "area_id",         null: false
    t.integer  "position_id",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["area_id"], name: "index_employees_on_area_id", using: :btree
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["position_id"], name: "index_employees_on_position_id", using: :btree
  end

  create_table "fond_employees", force: :cascade do |t|
    t.integer  "employee_id", null: false
    t.integer  "fond_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_fond_employees_on_employee_id", using: :btree
    t.index ["fond_id"], name: "index_fond_employees_on_fond_id", using: :btree
  end

  create_table "fonds", force: :cascade do |t|
    t.string   "document_type",   null: false
    t.integer  "document_number", null: false
    t.string   "business_name",   null: false
    t.string   "fond_type",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "general_parameters", force: :cascade do |t|
    t.integer  "round_type",    null: false
    t.integer  "laboral_days",  null: false
    t.string   "payday",        null: false
    t.decimal  "integral_base", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "log_time",   null: false
    t.integer  "user_id",    null: false
    t.integer  "option_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_logs_on_option_id", using: :btree
    t.index ["user_id"], name: "index_logs_on_user_id", using: :btree
  end

  create_table "novelties", force: :cascade do |t|
    t.string   "novelty_type",     null: false
    t.decimal  "novelty_value",    null: false
    t.string   "category",         null: false
    t.integer  "period",           null: false
    t.integer  "applied",          null: false
    t.string   "description",      null: false
    t.decimal  "percentage1",      null: false
    t.decimal  "percentage2",      null: false
    t.decimal  "percentage3",      null: false
    t.integer  "employee_id"
    t.integer  "payday_detail_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["employee_id"], name: "index_novelties_on_employee_id", using: :btree
    t.index ["payday_detail_id"], name: "index_novelties_on_payday_detail_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "option_name",   null: false
    t.boolean  "insert_action", null: false
    t.boolean  "update_action", null: false
    t.boolean  "delete_action", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "payday_details", force: :cascade do |t|
    t.decimal  "base_value",       null: false
    t.decimal  "win",              null: false
    t.decimal  "loss",             null: false
    t.decimal  "appropiation",     null: false
    t.decimal  "worked_days",      null: false
    t.date     "start_date",       null: false
    t.date     "end_date",         null: false
    t.integer  "concept_id",       null: false
    t.integer  "employee_id",      null: false
    t.integer  "payday_master_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["concept_id"], name: "index_payday_details_on_concept_id", using: :btree
    t.index ["employee_id"], name: "index_payday_details_on_employee_id", using: :btree
    t.index ["payday_master_id"], name: "index_payday_details_on_payday_master_id", using: :btree
  end

  create_table "payday_masters", force: :cascade do |t|
    t.string   "payday_type", null: false
    t.date     "payday_date", null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "position_name", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",   null: false
    t.string   "user_pass",   null: false
    t.string   "user_role",   null: false
    t.integer  "employee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_users_on_employee_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "vacations", force: :cascade do |t|
    t.decimal  "paid_days",        null: false
    t.decimal  "taken_days",       null: false
    t.date     "start_date",       null: false
    t.date     "end_date",         null: false
    t.integer  "employee_id",      null: false
    t.integer  "payday_master_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["employee_id"], name: "index_vacations_on_employee_id", using: :btree
    t.index ["payday_master_id"], name: "index_vacations_on_payday_master_id", using: :btree
  end

  add_foreign_key "employees", "areas"
  add_foreign_key "employees", "positions"
  add_foreign_key "fond_employees", "employees"
  add_foreign_key "fond_employees", "fonds"
  add_foreign_key "logs", "options"
  add_foreign_key "logs", "users"
  add_foreign_key "novelties", "employees"
  add_foreign_key "novelties", "payday_details"
  add_foreign_key "payday_details", "concepts"
  add_foreign_key "payday_details", "employees"
  add_foreign_key "payday_details", "payday_masters"
  add_foreign_key "users", "employees"
  add_foreign_key "vacations", "employees"
  add_foreign_key "vacations", "payday_masters"
end
