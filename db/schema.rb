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

ActiveRecord::Schema.define(version: 20170604095519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "action", null: false
    t.bigint "target_id", null: false
    t.string "target_type", null: false
    t.bigint "project_id", null: false
    t.json "meta", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_events_on_project_id"
    t.index ["target_type", "target_id"], name: "index_events_on_target_type_and_target_id"
    t.index ["user_id", "project_id"], name: "index_events_on_user_id_and_project_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "project_accesses", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "index_project_accesses_on_project_id_and_user_id", unique: true
    t.index ["project_id"], name: "index_project_accesses_on_project_id"
    t.index ["role"], name: "index_project_accesses_on_role"
    t.index ["user_id"], name: "index_project_accesses_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.string "team_memberships"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["user_id", "team_id"], name: "index_team_memberships_on_user_id_and_team_id", unique: true
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "content", null: false
    t.integer "status", default: 0, null: false
    t.bigint "project_id", null: false
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "assignee_id"
    t.index ["assignee_id"], name: "index_todos_on_assignee_id"
    t.index ["creator_id"], name: "index_todos_on_creator_id"
    t.index ["project_id", "creator_id"], name: "index_todos_on_project_id_and_creator_id"
    t.index ["project_id"], name: "index_todos_on_project_id"
    t.index ["status"], name: "index_todos_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "events", "projects"
  add_foreign_key "events", "users"
  add_foreign_key "project_accesses", "projects"
  add_foreign_key "project_accesses", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "todos", "projects"
  add_foreign_key "todos", "users", column: "assignee_id"
  add_foreign_key "todos", "users", column: "creator_id"
end
