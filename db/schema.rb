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

ActiveRecord::Schema.define(version: 20171204091118) do

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gurus", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "nama"
    t.string "nip"
    t.string "jk"
    t.date "ttl"
    t.string "alamat"
    t.string "no_tlp"
    t.string "mapel"
    t.string "pendidikan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kontaks", force: :cascade do |t|
    t.string "email"
    t.string "tlp"
    t.string "pengasuhan"
    t.string "kmi"
    t.string "ma"
    t.string "sikpb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nilais", force: :cascade do |t|
    t.string "nama"
    t.string "nis"
    t.string "nisn"
    t.string "kelas"
    t.integer "thn_ajaran"
    t.string "mapel"
    t.decimal "kkm"
    t.decimal "angka"
    t.decimal "praktik"
    t.string "huruf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pengasuhans", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "nama"
    t.string "jk"
    t.string "alamat"
    t.string "tempat"
    t.date "tanggal_lahir"
    t.string "tlp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "santris", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "nama"
    t.string "nis"
    t.string "nisn"
    t.string "jk"
    t.string "tempat"
    t.string "tl"
    t.string "agama"
    t.string "anak_ke"
    t.string "status_keluarga"
    t.string "alamat"
    t.string "tlp"
    t.string "kelas"
    t.string "tahun_masuk"
    t.string "nama_sekolah"
    t.string "alamat_sekolah"
    t.string "nama_ayah"
    t.string "nama_ibu"
    t.string "pekerjaan_ayah"
    t.string "pekerjaan_ibu"
    t.string "agama_ayah"
    t.string "agama_ibu"
    t.string "nama_wali"
    t.string "agama_wali"
    t.string "alamat_wali"
    t.string "tlp_wali"
    t.string "pekerjaan_wali"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
