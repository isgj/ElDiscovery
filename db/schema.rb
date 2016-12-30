# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161230090428) do

  create_table "partecipantis", force: :cascade do |t|
    t.string   "percorso"
    t.string   "utente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "percorsos", force: :cascade do |t|
    t.date     "data"
    t.time     "ora"
    t.string   "partenza"
    t.string   "destinazione"
    t.time     "durata"
    t.string   "utref"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "location"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  create_table "utentes", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "età"
    t.string   "sesso"
    t.string   "idg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "users"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true

end
