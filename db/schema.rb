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

ActiveRecord::Schema[7.0].define(version: 2022_02_16_220754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "zipcode"
    t.string "street"
    t.string "second_line"
    t.string "district"
    t.string "city"
    t.string "state"
    t.integer "ibge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "citizen_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "name"
    t.bigint "cpf"
    t.bigint "cns"
    t.string "email"
    t.datetime "birth_date", precision: nil
    t.bigint "phone"
    t.string "picture"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
