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

ActiveRecord::Schema.define(version: 20170105145038) do

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
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid",        null: false
    t.string   "name"
    t.string   "location"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

  create_table "utentes", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "età"
    t.string   "sesso"
    t.string   "idg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "foto"
  end

end
