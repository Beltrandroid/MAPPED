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

ActiveRecord::Schema.define(version: 20171107235446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_requests", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.jsonb "meta_data"
    t.datetime "sent_date"
    t.datetime "data_received_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_access_requests_on_campaign_id"
    t.index ["organization_id"], name: "index_access_requests_on_organization_id"
    t.index ["user_id"], name: "index_access_requests_on_user_id"
  end

  create_table "access_rights", force: :cascade do |t|
    t.string "action"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_access_rights_on_role_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "method_name"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "line1"
    t.string "line2"
    t.string "post_code"
    t.bigint "city_id"
    t.bigint "country_id"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
  end

  create_table "answers", force: :cascade do |t|
    t.jsonb "result"
    t.string "answerable_type"
    t.bigint "answerable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answerable_type", "answerable_id"], name: "index_answers_on_answerable_type_and_answerable_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.text "expanded_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns_questions", id: false, force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.bigint "question_id", null: false
    t.index ["campaign_id", "question_id"], name: "index_campaigns_questions_on_campaign_id_and_question_id"
    t.index ["question_id", "campaign_id"], name: "index_campaigns_questions_on_question_id_and_campaign_id"
  end

  create_table "campains_organizations", id: false, force: :cascade do |t|
    t.bigint "campain_id", null: false
    t.bigint "organization_id", null: false
    t.index ["campain_id", "organization_id"], name: "index_campains_organizations_on_campain_id_and_organization_id"
    t.index ["organization_id", "campain_id"], name: "index_campains_organizations_on_organization_id_and_campain_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "code_actions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "class_name"
    t.string "method_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "code_actions_transitions", id: false, force: :cascade do |t|
    t.bigint "code_action_id", null: false
    t.bigint "transition_id", null: false
    t.index ["code_action_id", "transition_id"], name: "index_actions_transitions_on_action_id_and_transition_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "method_name"
  end

  create_table "guards_transitions", id: false, force: :cascade do |t|
    t.bigint "guard_id", null: false
    t.bigint "transition_id", null: false
    t.index ["guard_id", "transition_id"], name: "index_guards_transitions_on_guard_id_and_transition_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "custom_1"
    t.text "custom_1_desc"
    t.text "custom_2"
    t.text "custom_2_desc"
    t.text "custom_3"
    t.text "custom_3_desc"
    t.index ["sector_id"], name: "index_organizations_on_sector_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.jsonb "metadata"
    t.boolean "mandatory"
    t.string "ui_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors_templates", id: false, force: :cascade do |t|
    t.bigint "sector_id"
    t.bigint "template_id"
    t.index ["sector_id"], name: "index_sectors_templates_on_sector_id"
    t.index ["template_id"], name: "index_sectors_templates_on_template_id"
  end

  create_table "template_versions", force: :cascade do |t|
    t.string "version"
    t.bigint "template_id"
    t.text "content"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.index ["template_id"], name: "index_template_versions_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "template_type"
  end

  create_table "transitions", force: :cascade do |t|
    t.string "name"
    t.bigint "from_state_id"
    t.bigint "to_state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_state_id"], name: "index_transitions_on_from_state_id"
    t.index ["to_state_id"], name: "index_transitions_on_to_state_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unconfirmed_email"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "first_name"
    t.string "last_name"
    t.string "preferred_language"
    t.text "custom_1"
    t.text "custom_2"
    t.text "custom_3"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workflow_states", force: :cascade do |t|
    t.string "name"
    t.bigint "workflow_type_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_initial_state", default: false
    t.index ["workflow_type_version_id"], name: "index_workflow_states_on_workflow_type_version_id"
  end

  create_table "workflow_transitions", force: :cascade do |t|
    t.bigint "workflow_id"
    t.bigint "transition_id"
    t.bigint "failed_action_id"
    t.bigint "failed_guard_id"
    t.string "action_failed_message"
    t.string "failed_guard_message"
    t.string "status"
    t.jsonb "rollback_failed_actions"
    t.jsonb "performed_actions"
    t.jsonb "internal_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["failed_action_id"], name: "index_workflow_transitions_on_failed_action_id"
    t.index ["failed_guard_id"], name: "index_workflow_transitions_on_failed_guard_id"
    t.index ["transition_id"], name: "index_workflow_transitions_on_transition_id"
    t.index ["workflow_id"], name: "index_workflow_transitions_on_workflow_id"
  end

  create_table "workflow_type_versions", force: :cascade do |t|
    t.float "version"
    t.bigint "workflow_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.index ["workflow_type_id"], name: "index_workflow_type_versions_on_workflow_type_id"
  end

  create_table "workflow_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflows", force: :cascade do |t|
    t.bigint "workflow_type_version_id"
    t.bigint "workflow_state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "access_request_id"
    t.index ["access_request_id"], name: "index_workflows_on_access_request_id"
    t.index ["workflow_state_id"], name: "index_workflows_on_workflow_state_id"
    t.index ["workflow_type_version_id"], name: "index_workflows_on_workflow_type_version_id"
  end

  add_foreign_key "access_requests", "organizations"
  add_foreign_key "access_requests", "users"
  add_foreign_key "access_rights", "roles"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "cities", "countries"
  add_foreign_key "organizations", "sectors"
  add_foreign_key "template_versions", "templates"
  add_foreign_key "transitions", "workflow_states", column: "from_state_id"
  add_foreign_key "transitions", "workflow_states", column: "to_state_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "workflow_states", "workflow_type_versions"
  add_foreign_key "workflow_transitions", "code_actions", column: "failed_action_id"
  add_foreign_key "workflow_transitions", "guards", column: "failed_guard_id"
  add_foreign_key "workflow_transitions", "transitions"
  add_foreign_key "workflow_transitions", "workflows"
  add_foreign_key "workflow_type_versions", "workflow_types"
  add_foreign_key "workflows", "access_requests"
  add_foreign_key "workflows", "workflow_states"
  add_foreign_key "workflows", "workflow_type_versions"
end
