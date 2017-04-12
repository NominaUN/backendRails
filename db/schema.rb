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

ActiveRecord::Schema.define(version: 20170412055931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name_area"
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "concept_name"
    t.string   "category"
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
    t.boolean  "integral_salary"
    t.integer  "area_id",         null: false
    t.integer  "position_id",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["area_id"], name: "index_employees_on_area_id", using: :btree
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["position_id"], name: "index_employees_on_position_id", using: :btree
  end

  create_table "fond_employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "fond_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_fond_employees_on_employee_id", using: :btree
    t.index ["fond_id"], name: "index_fond_employees_on_fond_id", using: :btree
  end

  create_table "fonds", force: :cascade do |t|
    t.string   "document_type",   null: false
    t.integer  "document_number", null: false
    t.string   "business_name",   null: false
    t.string   "type_of_fond",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "general_parameters", force: :cascade do |t|
    t.integer  "round_type"
    t.integer  "laboral_days"
    t.string   "payday"
    t.decimal  "integral_base"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "log_time"
    t.integer  "user_id"
    t.integer  "option_id"
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
    t.decimal  "percentage1"
    t.decimal  "percentage2"
    t.decimal  "percentage3"
    t.integer  "employee_id"
    t.integer  "payday_detail_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["employee_id"], name: "index_novelties_on_employee_id", using: :btree
    t.index ["payday_detail_id"], name: "index_novelties_on_payday_detail_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "action"
    t.boolean  "insert_action"
    t.boolean  "update_action"
    t.boolean  "delete_action"
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
    t.integer  "concept_id"
    t.integer  "employee_id"
    t.integer  "payday_master_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["concept_id"], name: "index_payday_details_on_concept_id", using: :btree
    t.index ["employee_id"], name: "index_payday_details_on_employee_id", using: :btree
    t.index ["payday_master_id"], name: "index_payday_details_on_payday_master_id", using: :btree
  end

  create_table "payday_masters", force: :cascade do |t|
    t.string   "payday_type"
    t.date     "payday_date"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "role"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_users_on_employee_id", using: :btree
  end

  create_table "vacations", force: :cascade do |t|
    t.decimal  "paid_days"
    t.decimal  "taken_days"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "employee_id"
    t.integer  "payday_master_id"
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
