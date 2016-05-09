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

ActiveRecord::Schema.define(version: 20160504190943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", id: false, force: :cascade do |t|
    t.string   "song_id"
    t.string   "song_title"
    t.string   "artist_name"
    t.string   "artist_id"
    t.string   "album"
    t.string   "img"
    t.string   "preview"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "songs", ["song_id"], name: "index_songs_on_song_id", unique: true, using: :btree

  create_table "songs_users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "song_id"
    t.boolean  "selected"
    t.datetime "date_added_to_playlist"
    t.string   "playlist_added_to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "songs_users", ["user_id", "song_id"], name: "index_songs_users_on_user_id_and_song_id", unique: true, using: :btree

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "display_name"
    t.string   "email"
    t.string   "img"
    t.string   "artist_one"
    t.string   "artist_two"
    t.string   "artist_three"
    t.string   "song_one"
    t.string   "song_two"
    t.string   "song_three"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
