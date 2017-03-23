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

ActiveRecord::Schema.define(version: 20170323004815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "document_type"
    t.integer  "document_number"
    t.string   "first_name"
    t.string   "other_name"
    t.string   "last_name"
    t.string   "second_surname"
    t.date     "birthdate"
    t.string   "birthplace"
    t.string   "address"
    t.string   "phones"
    t.string   "email"
    t.date     "admission_date"
    t.date     "retirement_date"
    t.decimal  "salary"
    t.boolean  "transport_aid"
    t.boolean  "integral_salary"
    t.integer  "area_id"
    t.integer  "position_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["area_id"], name: "index_employees_on_area_id", using: :btree
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
    t.string   "document_type"
    t.integer  "document_number"
    t.string   "business_name"
    t.string   "type_of_fond"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.integer  "employee_id"
    t.float    "paid_days"
    t.float    "taken_days"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_vacations_on_employee_id", using: :btree
  end

  add_foreign_key "employees", "areas"
  add_foreign_key "employees", "positions"
  add_foreign_key "fond_employees", "employees"
  add_foreign_key "fond_employees", "fonds"
  add_foreign_key "vacations", "employees"
end
