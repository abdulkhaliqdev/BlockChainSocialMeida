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

ActiveRecord::Schema.define(version: 2023_02_06_092224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.string "date_created"
    t.string "list_price"
    t.string "owner"
    t.bigint "collections_id", null: false
    t.text "img_data"
    t.boolean "for_sale"
    t.string "keywords"
    t.text "img_thumb_data"
    t.string "cloudinary_public_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collections_id"], name: "index_artworks_on_collections_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "user_id"
    t.text "image_data"
    t.datetime "published_at"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "users_id", null: false
    t.text "collection_img_data"
    t.string "cloudinary_public_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_collections_on_users_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "blog_id"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "followships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_followships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_followships_on_follower_id"
    t.index ["following_id"], name: "index_followships_on_following_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_likes_on_blog_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "nfts", force: :cascade do |t|
    t.integer "token_id"
    t.text "image_data"
    t.integer "cloudary_public_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri"
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "body"
    t.text "image_data"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_posts_on_users_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "nfts_id", null: false
    t.bigint "users_id", null: false
    t.integer "price"
    t.integer "royalty_percentage"
    t.text "image_thumbnail_data"
    t.string "description"
    t.string "cloudinary_public_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nfts_id"], name: "index_purchases_on_nfts_id"
    t.index ["users_id"], name: "index_purchases_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "followers"
    t.string "followings"
    t.text "description"
    t.string "city"
    t.text "from"
    t.text "relationship"
    t.integer "blog_count", default: 0, null: false
    t.integer "followships_count", default: 0, null: false
    t.integer "likes_count", default: 0, null: false
    t.text "profile_data"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artworks", "collections", column: "collections_id"
  add_foreign_key "blogs", "users"
  add_foreign_key "collections", "users", column: "users_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "invitations", "users"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "posts", "users", column: "users_id"
  add_foreign_key "purchases", "nfts", column: "nfts_id"
  add_foreign_key "purchases", "users", column: "users_id"
end
