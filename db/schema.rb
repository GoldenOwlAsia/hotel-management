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

ActiveRecord::Schema.define(version: 2019_11_12_043057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_orders", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_booking_orders_on_booking_id"
    t.index ["order_id"], name: "index_booking_orders_on_order_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "checkin_time"
    t.datetime "checkout_time"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rent_type"
    t.decimal "price"
    t.bigint "order_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["order_id"], name: "index_bookings_on_order_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "customer_nin"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_nin"], name: "index_customers_on_customer_nin"
  end

  create_table "guests", force: :cascade do |t|
    t.string "guest_type"
    t.integer "quantity"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_guests_on_booking_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "order_date"
    t.decimal "total"
    t.decimal "paid"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "hotel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_roles_on_hotel_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number"
    t.string "room_type"
    t.bigint "hotel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "floor_number"
    t.decimal "price"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_service_orders_on_order_id"
    t.index ["service_id"], name: "index_service_orders_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "booking_orders", "bookings"
  add_foreign_key "booking_orders", "orders"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "orders"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "guests", "bookings"
  add_foreign_key "orders", "customers"
  add_foreign_key "roles", "hotels"
  add_foreign_key "roles", "users"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "service_orders", "orders"
  add_foreign_key "service_orders", "services"
end
