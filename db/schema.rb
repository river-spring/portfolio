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

ActiveRecord::Schema.define(version: 20_200_921_033_408) do
  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'user_id'
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'production_id'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.decimal 'score', precision: 5, scale: 3
  end

  create_table 'friends', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'friend_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'friend_flag'
    t.index ['friend_id'], name: 'index_friends_on_friend_id'
    t.index %w[user_id friend_id], name: 'index_friends_on_user_id_and_friend_id', unique: true
    t.index ['user_id'], name: 'index_friends_on_user_id'
  end

  create_table 'group_users', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'group_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.text 'outline'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image_id'
  end

  create_table 'productions', force: :cascade do |t|
    t.integer 'shelf_id'
    t.string 'title'
    t.text 'outline'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image_id'
    t.string 'release_date'
  end

  create_table 'recommendations', force: :cascade do |t|
    t.integer 'friend_id'
    t.string 'title'
    t.text 'outline'
    t.string 'image_id'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'release_date'
    t.integer 'user_id'
  end

  create_table 'shelves', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'group_id'
    t.string 'name'
    t.text 'outline'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'shelf_image_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'user_id'
    t.string 'name'
    t.text 'introduction'
    t.datetime 'deleted_at'
    t.string 'profile_image_id'
    t.string 'mypage_image_id'
    t.datetime 'current_sign_in_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.string 'current_sign_in_ip'
    t.datetime 'last_sign_in_at'
    t.string 'last_sign_in_ip'
    t.boolean 'status', default: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
