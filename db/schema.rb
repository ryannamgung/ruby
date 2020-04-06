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

ActiveRecord::Schema.define(version: 2020_04_06_021657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sellers", force: :cascade do |t|
    t.string "seller_id", null: false
    t.string "cuisine_name"
    t.string "name"
    t.string "story"
    t.boolean "accept_donations", default: true, null: false
    t.boolean "sell_gift_cards", default: false, null: false
    t.string "owner_name"
    t.string "owner_image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_sellers_on_seller_id"
  end

end
