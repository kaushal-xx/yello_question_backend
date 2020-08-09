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

ActiveRecord::Schema.define(version: 2020_08_09_073422) do

  create_table "account", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.string "hash_id", limit: 456, collation: "utf8_general_ci"
    t.string "auth_id", limit: 455, collation: "utf8_general_ci"
    t.string "phone", collation: "utf8_general_ci"
    t.string "email", collation: "utf8_general_ci"
    t.integer "status"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "app_version", limit: 45
    t.string "app_type", limit: 45
    t.datetime "modification_time"
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["auth_id"], name: "auth_id_UNIQUE", unique: true
  end

  create_table "address", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "account_id"
    t.string "city", limit: 256, collation: "utf8_general_ci"
    t.string "state", limit: 256, collation: "utf8_general_ci"
    t.string "country", limit: 256, collation: "utf8_general_ci"
    t.string "zip", collation: "utf8_general_ci"
    t.string "lat", collation: "utf8_general_ci"
    t.string "lng", collation: "utf8_general_ci"
    t.integer "privacy", limit: 1
    t.string "address_line", limit: 400, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 456, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["account_id"], name: "fk_add_account_id"
  end

  create_table "app_util", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "latest_app_version", limit: 45
    t.string "previous_app_version", limit: 45
    t.string "app_type", limit: 45
    t.integer "status", limit: 1
    t.string "download_link", limit: 455
    t.string "message", limit: 455
    t.string "created_by", limit: 455
    t.string "modified_by", limit: 455
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "bookmark", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "post_id"
    t.string "account_hash_id", limit: 456
    t.integer "created_by"
    t.integer "modified_by"
    t.string "post_hash_id", limit: 456
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.string "hash_id", limit: 455
    t.index ["account_id"], name: "fk_account_id_idx"
  end

  create_table "category", primary_key: "categoryID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 300
    t.string "description", limit: 300
    t.string "imageurl", limit: 455
    t.date "creationDate"
    t.string "type", limit: 45
    t.integer "created_by"
    t.integer "modified_by"
    t.string "category_hash_id", limit: 456
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["categoryID"], name: "categoryID_UNIQUE", unique: true
  end

  create_table "challange_questions", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "challange_id", null: false
    t.string "question", limit: 455, null: false
    t.integer "post_id", null: false
    t.string "post_hash_id", limit: 455
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "challanges", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hash_id", limit: 455
    t.string "name", limit: 200, null: false
    t.text "description", null: false
    t.datetime "from_date_time"
    t.datetime "to_date_time"
    t.integer "status", limit: 1
    t.integer "total_points"
    t.string "img_url", limit: 455
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "coin_earn", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "post_id"
    t.integer "point_count"
    t.integer "type", limit: 1
    t.integer "created_by"
    t.integer "modified_by"
    t.string "coin_earn_hash_id", limit: 456
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "fcm_token", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.text "token"
    t.integer "type", limit: 1
    t.integer "account_id"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["account_id"], name: "fk_account_id_idx"
  end

  create_table "followers_connection", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "account_id"
    t.integer "following_id"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "following_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["account_id"], name: "fk_freind_connection_from_account_id_idx"
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "followers_connection_activity", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.integer "status", limit: 1, comment: "Pending, Accecpted, Rejected, UnFollow, Follow"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "followers_ca_hash_id", limit: 455
    t.datetime "creation_time"
    t.datetime "modification_time"
  end

  create_table "park_account", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "account_id"
    t.string "account_hash_id", limit: 455
    t.string "hash_id", limit: 455
    t.integer "status", limit: 1, comment: "0 : Activeted , 1 : DeActivated , 2 : Request for ReActive, 3 : Request for Suspention ,4 : Suspended by Admin, 5 : Request for Revoke Suspention.  "
    t.integer "type_id", limit: 1, comment: "1 : post need to restricted\n2 : perso need to restricted"
    t.string "relative_hash_id", limit: 455, comment: "Either post ID or account id"
    t.text "reason"
    t.text "reasontags"
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "modification_time"
    t.index ["account_id"], name: "fk_park_ac_id_idx"
  end

  create_table "points_tally", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.integer "points", null: false
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "post_category", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
    t.string "category_name", limit: 45
    t.integer "created_by"
    t.integer "modified_by"
    t.string "post_category_hash_id", limit: 455
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_comment", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "post_id"
    t.integer "commented_by"
    t.text "comment"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455
    t.string "post_hash_id", limit: 455
    t.boolean "liked"
    t.text "creator_reply"
    t.datetime "creator_reply_date"
    t.boolean "rsvp"
    t.boolean "best_answer"
    t.integer "wish_fullfilled", limit: 1
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_document", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "document_url", limit: 256, collation: "utf8_general_ci"
    t.string "document_thumb_url", collation: "utf8_general_ci", comment: "sa"
    t.integer "document_type", limit: 1
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.json "explicit_annotation"
    t.boolean "active"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_event", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title", limit: 45
    t.text "description"
    t.date "start_date"
    t.time "start_time"
    t.date "end_date"
    t.time "end_time"
    t.integer "post_id"
    t.string "event_hash_id", collation: "utf8_general_ci"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_event_attendee", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "event_id"
    t.integer "attend_by"
    t.integer "name", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["event_id"], name: "fk_post_event_attendee_idx"
  end

  create_table "post_event_location", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "event_id"
    t.string "city", collation: "utf8_general_ci"
    t.string "state", collation: "utf8_general_ci"
    t.string "country", collation: "utf8_general_ci"
    t.string "zip", collation: "utf8_general_ci"
    t.string "lat", collation: "utf8_general_ci"
    t.string "lng", collation: "utf8_general_ci"
    t.string "address_line", limit: 400, collation: "utf8_general_ci"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "post_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["event_id"], name: "fk_post_event_loc_id_idx"
  end

  create_table "post_like", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "type", limit: 45, collation: "utf8_general_ci"
    t.integer "like_by"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "post_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_location", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "city", collation: "utf8_general_ci"
    t.string "state", collation: "utf8_general_ci"
    t.string "country", collation: "utf8_general_ci"
    t.string "zip", collation: "utf8_general_ci"
    t.string "lat", collation: "utf8_general_ci"
    t.string "lng", collation: "utf8_general_ci"
    t.text "address_line", size: :medium, collation: "utf8_general_ci"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "post_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["post_id"], name: "fk_post_location_post_id_idx"
  end

  create_table "post_point", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_type"
    t.integer "point_on_post"
    t.integer "point_on_response"
    t.integer "point_on_best_response"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
  end

  create_table "post_poll", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "label"
    t.datetime "duration"
    t.integer "post_id"
    t.datetime "creation_date"
    t.string "poll_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_poll_option", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "poll_id"
    t.text "option_text"
    t.datetime "creation_date"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "post_poll_option_hash_id", limit: 455, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["poll_id"], name: "fk_poll_id_idx"
  end

  create_table "post_poll_result", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "poll_id"
    t.integer "option_id"
    t.integer "count"
    t.datetime "creation_date"
    t.integer "created_by"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "modified_by"
    t.string "post_poll_result_hash_id", limit: 455, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["poll_id"], name: "fk_poll_id_idx"
  end

  create_table "post_question", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "question"
    t.string "question_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "post_id"
    t.boolean "resolved"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_rsvp", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "event_id"
    t.integer "post_id"
    t.string "post_hash_id", limit: 455
    t.integer "status", limit: 1
    t.string "attendee_name", limit: 200
    t.string "attendee_profile_pic", limit: 600
    t.string "account_hash_id", limit: 455
    t.datetime "creation_time"
    t.integer "created_by"
    t.string "hash_id", limit: 455
    t.index ["event_id"], name: "fk_ post_rsvp_id_idx"
  end

  create_table "post_tag", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "post_id"
    t.datetime "creaton_date"
    t.string "tag_name", limit: 45
    t.integer "created_by"
    t.integer "modified_by"
    t.string "post_tag_hash_id", limit: 455, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_tip", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "tip_text", collation: "utf8mb4_general_ci"
    t.string "tip_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "post_id"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_view", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "type", limit: 45, collation: "utf8_general_ci"
    t.integer "view_by"
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "post_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["post_id"], name: "fk_post_id_idx"
  end

  create_table "post_wish", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "wish_text"
    t.string "wish_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "post_id"
    t.boolean "fulfilled"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
  end

  create_table "post_wish_tracker", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "wish_id"
    t.string "fullfill_requestee_hash_id", limit: 455, null: false
    t.text "fullfill_requestee_name", null: false
    t.text "fullfill_requestee_message"
    t.boolean "fullfill_status"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["wish_id"], name: "fk_post_wish_tracker_idx"
  end

  create_table "profile", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "account_id"
    t.string "name", limit: 100
    t.string "phone", limit: 40
    t.string "img_url", limit: 455
    t.string "email", limit: 40
    t.string "dob", limit: 45, collation: "utf8_general_ci"
    t.string "bio", limit: 455, collation: "utf8_general_ci"
    t.integer "user_type", limit: 1
    t.string "gender", limit: 10, collation: "utf8_general_ci"
    t.integer "uuid"
    t.string "citizenship", limit: 45, collation: "utf8_general_ci"
    t.integer "privacy", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["account_id"], name: "fk_account_id"
  end

  create_table "profile_image_upload", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "profile_id"
    t.string "image_url", collation: "utf8_general_ci"
    t.string "thumb_url", collation: "utf8_general_ci"
    t.integer "image_type", limit: 1
    t.integer "privacy"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "profile_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["profile_id"], name: "fk_profile_image_id"
  end

  create_table "redeem_catalogue", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hash_id", limit: 455
    t.text "prize"
    t.integer "prize_points"
    t.string "img_url", limit: 455
    t.text "description"
    t.integer "status", limit: 1
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "current_stock", default: 0
    t.integer "total_stock", default: 0
    t.integer "created_by"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "search_index", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "key_words", null: false
    t.integer "post_type", limit: 1, null: false
    t.integer "post_id", null: false
    t.string "post_hash_id", limit: 455, collation: "utf8_icelandic_ci"
    t.integer "status", limit: 1, default: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.string "account_hash_id", limit: 455, collation: "utf8_icelandic_ci"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
  end

  create_table "tag", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 455
    t.string "description", limit: 455, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "status", limit: 1
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
  end

  create_table "test_table", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.text "comment", size: :medium
  end

  create_table "user_activity", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "followers", default: 0
    t.integer "following", default: 0
    t.integer "question_answered", default: 0
    t.integer "challanges_completed", default: 0
    t.integer "coins_earned", default: 0
    t.integer "total_coins_earned", default: 0
    t.index ["profile_id"], name: "fk_profile_id_idx"
  end

  create_table "user_category", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "account_id"
    t.integer "category_id"
    t.string "title", limit: 440, collation: "utf8_general_ci"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 456, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "interest_hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "image_url", limit: 455
    t.index ["account_id"], name: "fk_user_cat_account_id"
  end

  create_table "user_challange_answers", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "challange_id", null: false
    t.integer "account_id", null: false
    t.string "account_hash_id", limit: 455, null: false
    t.integer "post_id", null: false
    t.string "post_hash_id", limit: 455
    t.text "answer"
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "user_notification", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.integer "post_id"
    t.integer "type", limit: 1
    t.integer "type_action", limit: 1
    t.text "detail"
    t.integer "seen_status", limit: 1, default: 0
    t.integer "status", limit: 1
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "notify_item_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "notify", limit: 1
  end

  create_table "user_point_activity", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci", force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.integer "coins_earned"
    t.integer "activity_type"
    t.integer "post_id"
    t.string "post_hash_id", limit: 455
  end

  create_table "user_post", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "account_id"
    t.integer "post_type", limit: 1, comment: "system post =0, and userpost = 1"
    t.integer "status", limit: 1, comment: "default = 0"
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.integer "created_by"
    t.integer "modified_by"
    t.string "hash_id", limit: 455, collation: "utf8_general_ci"
    t.string "account_hash_id", limit: 455, collation: "utf8_general_ci"
    t.index ["account_id"], name: "fk_user_post_account_id"
  end

  create_table "user_redeem_activity", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "account_id"
    t.string "account_hash_id", limit: 455
    t.integer "redeem_item_id"
    t.integer "status", limit: 1
    t.integer "redeem_points"
    t.integer "created_by"
    t.datetime "creation_time", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["redeem_item_id"], name: "fk_redeem_catalogue_id_idx"
  end

  create_table "user_setting", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "push_notification"
    t.boolean "account_visibility"
    t.integer "profile_id"
    t.integer "profile_privacy", limit: 1
    t.integer "created_by"
    t.integer "modified_by"
    t.string "user_setting_hash_id", limit: 455
    t.datetime "creation_time"
    t.datetime "modification_time"
    t.index ["profile_id"], name: "fk_profile_id_idx"
  end

  create_table "user_stratification", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "label"
    t.integer "label_value"
    t.string "icon", limit: 455
  end

  add_foreign_key "address", "account", name: "fk_add_account_id"
  add_foreign_key "bookmark", "account", name: "fk_book_account_id"
  add_foreign_key "coin_earn", "user_post", column: "post_id", name: "fk_coin_post_id"
  add_foreign_key "fcm_token", "account", name: "fk_fcm_account_id"
  add_foreign_key "followers_connection", "account", name: "fk_follow_account_id"
  add_foreign_key "park_account", "account", name: "fk_park_ac_id"
  add_foreign_key "post_category", "user_post", column: "post_id", name: "fk_post_cat_id"
  add_foreign_key "post_comment", "user_post", column: "post_id", name: "fk_post_comment_id"
  add_foreign_key "post_document", "user_post", column: "post_id", name: "fk_post_doc_id"
  add_foreign_key "post_event", "user_post", column: "post_id", name: "fk_post_event_id"
  add_foreign_key "post_event_attendee", "post_event", column: "event_id", name: "fk_post_event_attendee"
  add_foreign_key "post_event_location", "post_event", column: "event_id", name: "fk_post_event_loc_id"
  add_foreign_key "post_like", "user_post", column: "post_id", name: "fk_post_like_id"
  add_foreign_key "post_location", "user_post", column: "post_id", name: "fk_post_location_post_id"
  add_foreign_key "post_poll", "user_post", column: "post_id", name: "fk_post_poll_id"
  add_foreign_key "post_poll_option", "post_poll", column: "poll_id", name: "fk_post_poll_option_id"
  add_foreign_key "post_poll_result", "post_poll", column: "poll_id", name: "fk_post_poll_result_id"
  add_foreign_key "post_question", "user_post", column: "post_id", name: "fk_post_ques_id"
  add_foreign_key "post_rsvp", "post_event", column: "event_id", name: "fk_ post_rsvp_id"
  add_foreign_key "post_tag", "user_post", column: "post_id", name: "fk_post_tag_id"
  add_foreign_key "post_tip", "user_post", column: "post_id", name: "fk_post_tip_id"
  add_foreign_key "post_view", "user_post", column: "post_id", name: "fk_post_view_id"
  add_foreign_key "post_wish_tracker", "post_wish", column: "wish_id", name: "fk_post_wish_tracker"
  add_foreign_key "profile", "account", name: "fk_account_id"
  add_foreign_key "profile_image_upload", "profile", name: "fk_profile_image_id"
  add_foreign_key "user_activity", "profile", name: "fk_user_act_profile_id"
  add_foreign_key "user_category", "account", name: "fk_user_cat_account_id"
  add_foreign_key "user_post", "account", name: "fk_user_post_account_id"
  add_foreign_key "user_redeem_activity", "redeem_catalogue", column: "redeem_item_id", name: "fk_redeem_catalogue_id"
  add_foreign_key "user_setting", "profile", name: "fk_profile_id"
end
