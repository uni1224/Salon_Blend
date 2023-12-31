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

ActiveRecord::Schema.define(version: 20_230_804_011_652) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id', null: false
    t.text 'content', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.decimal 'score', precision: 5, scale: 3
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'messages', force: :cascade do |t|
    t.integer 'room_id', null: false
    t.integer 'user_id'
    t.integer 'salon_id'
    t.text 'message', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_messages_on_room_id'
    t.index ['salon_id'], name: 'index_messages_on_salon_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'salon_id'
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'read_counts', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'post_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_read_counts_on_post_id'
    t.index ['user_id'], name: 'index_read_counts_on_user_id'
  end

  create_table 'reservations', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'day'
    t.datetime 'time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'start_time'
  end

  create_table 'rooms', force: :cascade do |t|
    t.integer 'reservation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['reservation_id'], name: 'index_rooms_on_reservation_id'
  end

  create_table 'salons', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name', default: '', null: false
    t.text 'introduction', null: false
    t.string 'phone_number', default: '', null: false
    t.string 'postal_code', default: '', null: false
    t.string 'address', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_salons_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_salons_on_reset_password_token', unique: true
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.integer 'post_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'last_name_kana', default: '', null: false
    t.string 'first_name', default: '', null: false
    t.string 'first_name_kana', default: '', null: false
    t.string 'nick_name', default: '', null: false
    t.date 'birthday', null: false
    t.string 'address', default: '', null: false
    t.string 'postal_code', default: '', null: false
    t.string 'phone_number', default: '', null: false
    t.boolean 'is_deleted', default: false, null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'messages', 'rooms'
  add_foreign_key 'messages', 'salons'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'read_counts', 'posts'
  add_foreign_key 'read_counts', 'users'
  add_foreign_key 'rooms', 'reservations'
end
