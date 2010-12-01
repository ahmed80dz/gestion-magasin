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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101201171906) do

  create_table "achats", :force => true do |t|
    t.integer  "id_bon_achat"
    t.integer  "id_produit"
    t.string   "designation"
    t.integer  "quantite"
    t.decimal  "prix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bon_achats", :force => true do |t|
    t.string   "code_facture"
    t.integer  "id_fournisseur"
    t.integer  "pyee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.integer  "code_client"
    t.string   "nom"
    t.integer  "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factures", :force => true do |t|
    t.string   "code_facture"
    t.integer  "payee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  add_index "factures", ["client_id"], :name => "index_factures_on_client_id"

  create_table "fournisseurs", :force => true do |t|
    t.integer  "code_fournisseur"
    t.string   "nom"
    t.integer  "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produits", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "prix"
    t.string   "ref"
    t.integer  "quantite"
    t.integer  "quantite_min"
    t.decimal  "prix_min"
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "users", :force => true do |t|
    t.string   "login",                                               :null => false
    t.integer  "role",                                :default => 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "ventes", :force => true do |t|
    t.string   "designation"
    t.integer  "quantite"
    t.decimal  "prix"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facture_id"
    t.integer  "produit_id"
  end

  add_index "ventes", ["facture_id"], :name => "index_ventes_on_facture_id"
  add_index "ventes", ["produit_id"], :name => "index_ventes_on_produit_id"

end
