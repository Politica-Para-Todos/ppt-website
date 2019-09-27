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

ActiveRecord::Schema.define(version: 2019_09_22_221118) do

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
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "address_country", primary_key: "iso_3166_1_a2", id: :string, limit: 2, force: :cascade do |t|
    t.string "iso_3166_1_a3", limit: 3, null: false
    t.string "iso_3166_1_numeric", limit: 3, null: false
    t.string "printable_name", limit: 128, null: false
    t.string "name", limit: 128, null: false
    t.integer "display_order", limit: 2, null: false
    t.boolean "is_shipping_country", null: false
    t.index ["display_order"], name: "address_country_010c8bce"
    t.index ["is_shipping_country"], name: "address_country_0b3676f8"
    t.index ["iso_3166_1_a2"], name: "address_country_iso_3166_1_a2_68dd696c4cfe6e1_like", opclass: :varchar_pattern_ops
  end

  create_table "address_useraddress", id: :serial, force: :cascade do |t|
    t.string "title", limit: 64, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "line1", limit: 255, null: false
    t.string "line2", limit: 255, null: false
    t.string "line3", limit: 255, null: false
    t.string "line4", limit: 255, null: false
    t.string "state", limit: 255, null: false
    t.string "postcode", limit: 64, null: false
    t.text "search_text", null: false
    t.string "phone_number", limit: 128, null: false
    t.text "notes", null: false
    t.boolean "is_default_for_shipping", null: false
    t.boolean "is_default_for_billing", null: false
    t.integer "num_orders", null: false
    t.string "hash", limit: 255, null: false
    t.datetime "date_created", null: false
    t.string "country_id", limit: 2, null: false
    t.integer "user_id", null: false
    t.string "company", limit: 255, null: false
    t.string "eu_vat", limit: 14, null: false
    t.index ["country_id"], name: "address_useraddress_93bfec8a"
    t.index ["country_id"], name: "address_useraddress_country_id_77f619edf3bc65b0_like", opclass: :varchar_pattern_ops
    t.index ["hash"], name: "address_useraddress_0800fc57"
    t.index ["hash"], name: "address_useraddress_hash_e90bcd8a3f691d6_like", opclass: :varchar_pattern_ops
    t.index ["user_id", "hash"], name: "address_useraddress_user_id_2f96b9258352b0fb_uniq", unique: true
    t.index ["user_id"], name: "address_useraddress_e8701ad4"
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

  create_table "analytics_productrecord", id: :serial, force: :cascade do |t|
    t.integer "num_views", null: false
    t.integer "num_basket_additions", null: false
    t.integer "num_purchases", null: false
    t.float "score", null: false
    t.integer "product_id", null: false
    t.index ["num_purchases"], name: "analytics_productrecord_81a5c7b1"
    t.index ["product_id"], name: "analytics_productrecord_product_id_key", unique: true
  end

  create_table "analytics_userproductview", id: :serial, force: :cascade do |t|
    t.datetime "date_created", null: false
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.index ["product_id"], name: "analytics_userproductview_9bea82de"
    t.index ["user_id"], name: "analytics_userproductview_e8701ad4"
  end

  create_table "analytics_userrecord", id: :serial, force: :cascade do |t|
    t.integer "num_product_views", null: false
    t.integer "num_basket_additions", null: false
    t.integer "num_orders", null: false
    t.integer "num_order_lines", null: false
    t.integer "num_order_items", null: false
    t.decimal "total_spent", precision: 12, scale: 2, null: false
    t.datetime "date_last_order"
    t.integer "user_id", null: false
    t.index ["num_order_items"], name: "analytics_userrecord_25cd4b4a"
    t.index ["num_order_lines"], name: "analytics_userrecord_89bb6879"
    t.index ["num_orders"], name: "analytics_userrecord_29bdb5ea"
    t.index ["user_id"], name: "analytics_userrecord_user_id_key", unique: true
  end

  create_table "analytics_usersearch", id: :serial, force: :cascade do |t|
    t.string "query", limit: 255, null: false
    t.datetime "date_created", null: false
    t.integer "user_id", null: false
    t.index ["query"], name: "analytics_usersearch_1b1cc7f0"
    t.index ["query"], name: "analytics_usersearch_query_74293a59e3fb971b_like", opclass: :varchar_pattern_ops
    t.index ["user_id"], name: "analytics_usersearch_e8701ad4"
  end

  create_table "angels_aboutpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_careservice", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "short_description", null: false
    t.text "description", null: false
    t.text "for_whom", null: false
    t.text "our_help", null: false
    t.text "conditions", null: false
    t.integer "icon_id"
    t.index ["icon_id"], name: "angels_careservice_fe6647e8"
  end

  create_table "angels_careservicedocument", id: :integer, default: -> { "nextval('angels_conditiondocument_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "document_id", null: false
    t.integer "page_id", null: false
    t.index ["document_id"], name: "angels_conditiondocument_e7fafc10"
    t.index ["page_id"], name: "angels_conditiondocument_1a63c800"
  end

  create_table "angels_contactspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_faqspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_homepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_homepagefeaturedcareservice", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "care_service_id", null: false
    t.integer "page_id", null: false
    t.index ["care_service_id"], name: "angels_homepagefeaturedcareservice_da5d0ed7"
    t.index ["page_id"], name: "angels_homepagefeaturedcareservice_1a63c800"
  end

  create_table "angels_patientcarepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_privacypolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_staffindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "angels_staffmember", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "job_title", limit: 60, null: false
    t.text "description", null: false
    t.integer "profile_photo_id"
    t.text "short_description", null: false
    t.string "linkedin_url", limit: 2083, null: false
    t.string "twitter_url", limit: 2083, null: false
    t.index ["profile_photo_id"], name: "angels_staffmember_1c716876"
  end

  create_table "angels_termsandconditionspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "annotations", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.bigint "manifesto_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_annotations_on_category_id"
    t.index ["manifesto_item_id"], name: "index_annotations_on_manifesto_item_id"
    t.index ["user_id"], name: "index_annotations_on_user_id"
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index ["name"], name: "auth_group_name_56d9bd0deb21cf2d_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_key", unique: true
    t.index ["group_id"], name: "auth_group_permissions_0e939a4f"
    t.index ["permission_id"], name: "auth_group_permissions_8373b171"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_key", unique: true
    t.index ["content_type_id"], name: "auth_permission_417f1b1c"
  end

  create_table "auth_user", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login"
    t.boolean "is_superuser", null: false
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 40, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", null: false
    t.index ["email"], name: "auth_user_email_4e10ba8f2db0dfb8_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "auth_user_email_key", unique: true
  end

  create_table "auth_user_groups", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_0e939a4f"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_key", unique: true
    t.index ["user_id"], name: "auth_user_groups_e8701ad4"
  end

  create_table "auth_user_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_8373b171"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_key", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_e8701ad4"
  end

  create_table "basket_basket", id: :serial, force: :cascade do |t|
    t.string "status", limit: 128, null: false
    t.datetime "date_created", null: false
    t.datetime "date_merged"
    t.datetime "date_submitted"
    t.integer "owner_id"
    t.index ["owner_id"], name: "basket_basket_5e7b1936"
  end

  create_table "basket_basket_vouchers", id: :serial, force: :cascade do |t|
    t.integer "basket_id", null: false
    t.integer "voucher_id", null: false
    t.index ["basket_id", "voucher_id"], name: "basket_basket_vouchers_basket_id_voucher_id_key", unique: true
    t.index ["basket_id"], name: "basket_basket_vouchers_afdeaea9"
    t.index ["voucher_id"], name: "basket_basket_vouchers_3e8639ee"
  end

  create_table "basket_line", id: :serial, force: :cascade do |t|
    t.string "line_reference", limit: 128, null: false
    t.integer "quantity", null: false
    t.string "price_currency", limit: 12, null: false
    t.decimal "price_excl_tax", precision: 12, scale: 2
    t.decimal "price_incl_tax", precision: 12, scale: 2
    t.datetime "date_created", null: false
    t.integer "basket_id", null: false
    t.integer "product_id", null: false
    t.integer "stockrecord_id", null: false
    t.index ["basket_id", "line_reference"], name: "basket_line_basket_id_70f8bb22f8ddb135_uniq", unique: true
    t.index ["basket_id"], name: "basket_line_afdeaea9"
    t.index ["line_reference"], name: "basket_line_767217f5"
    t.index ["line_reference"], name: "basket_line_line_reference_7d49160d3113bd47_like", opclass: :varchar_pattern_ops
    t.index ["product_id"], name: "basket_line_9bea82de"
    t.index ["stockrecord_id"], name: "basket_line_271c5733"
  end

  create_table "basket_lineattribute", id: :serial, force: :cascade do |t|
    t.string "value", limit: 255, null: false
    t.integer "line_id", null: false
    t.integer "option_id", null: false
    t.index ["line_id"], name: "basket_lineattribute_b3ae486a"
    t.index ["option_id"], name: "basket_lineattribute_28df3725"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "district"
    t.string "photo"
    t.boolean "is_lead_candidate"
    t.string "candidate_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.bigint "party_id"
    t.text "biography"
    t.string "biography_source"
    t.string "link_parlamento"
    t.string "photo_source"
    t.index ["party_id"], name: "index_candidates_on_party_id"
  end

  create_table "careers_jobapplication", id: :serial, force: :cascade do |t|
    t.string "candidate_name", limit: 255, null: false
    t.string "candidate_email", limit: 254, null: false
    t.text "message", null: false
    t.string "position", limit: 255, null: false
    t.string "organization", limit: 255, null: false
    t.integer "page_id"
    t.index ["page_id"], name: "careers_jobapplication_1a63c800"
  end

  create_table "catalogue_attributeoption", id: :serial, force: :cascade do |t|
    t.string "option", limit: 255, null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "catalogue_attributeoption_0e939a4f"
  end

  create_table "catalogue_attributeoptiongroup", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
  end

  create_table "catalogue_category", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.integer "depth", null: false
    t.integer "numchild", null: false
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.string "image", limit: 255
    t.string "slug", limit: 255, null: false
    t.index ["name"], name: "catalogue_category_b068931c"
    t.index ["name"], name: "catalogue_category_name_6735eb49e4ad0ca2_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "catalogue_category_path_28321e2984fd433b_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "catalogue_category_path_key", unique: true
    t.index ["slug"], name: "catalogue_category_2dbcba41"
    t.index ["slug"], name: "catalogue_category_slug_427c4b2e3a7934bb_like", opclass: :varchar_pattern_ops
  end

  create_table "catalogue_option", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 128, null: false
    t.string "type", limit: 128, null: false
    t.index ["code"], name: "catalogue_option_code_10032e2ac2b26a66_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "catalogue_option_code_key", unique: true
  end

  create_table "catalogue_product", id: :serial, force: :cascade do |t|
    t.string "structure", limit: 10, null: false
    t.string "upc", limit: 64
    t.string "title", limit: 255, null: false
    t.string "slug", limit: 255, null: false
    t.text "description", null: false
    t.float "rating"
    t.datetime "date_created", null: false
    t.datetime "date_updated", null: false
    t.boolean "is_discountable", null: false
    t.integer "parent_id"
    t.integer "product_class_id"
    t.integer "cpl_course_id"
    t.index ["cpl_course_id"], name: "catalogue_product_4bdbcd37"
    t.index ["date_updated"], name: "catalogue_product_9474e4b5"
    t.index ["parent_id"], name: "catalogue_product_6be37982"
    t.index ["product_class_id"], name: "catalogue_product_c6619e6f"
    t.index ["slug"], name: "catalogue_product_2dbcba41"
    t.index ["slug"], name: "catalogue_product_slug_18622398c66fd087_like", opclass: :varchar_pattern_ops
    t.index ["upc"], name: "catalogue_product_upc_689014a92a8625cc_like", opclass: :varchar_pattern_ops
    t.index ["upc"], name: "catalogue_product_upc_key", unique: true
  end

  create_table "catalogue_product_product_options", id: :serial, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "option_id", null: false
    t.index ["option_id"], name: "catalogue_product_product_options_28df3725"
    t.index ["product_id", "option_id"], name: "catalogue_product_product_options_product_id_option_id_key", unique: true
    t.index ["product_id"], name: "catalogue_product_product_options_9bea82de"
  end

  create_table "catalogue_productattribute", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 128, null: false
    t.string "type", limit: 20, null: false
    t.boolean "required", null: false
    t.integer "option_group_id"
    t.integer "product_class_id"
    t.index ["code"], name: "catalogue_productattribute_c1336794"
    t.index ["code"], name: "catalogue_productattribute_code_56305112dde2d495_like", opclass: :varchar_pattern_ops
    t.index ["option_group_id"], name: "catalogue_productattribute_2f493fea"
    t.index ["product_class_id"], name: "catalogue_productattribute_c6619e6f"
  end

  create_table "catalogue_productattributevalue", id: :serial, force: :cascade do |t|
    t.text "value_text"
    t.integer "value_integer"
    t.boolean "value_boolean"
    t.float "value_float"
    t.text "value_richtext"
    t.date "value_date"
    t.string "value_file", limit: 255
    t.string "value_image", limit: 255
    t.integer "entity_object_id"
    t.integer "attribute_id", null: false
    t.integer "entity_content_type_id"
    t.integer "product_id", null: false
    t.integer "value_option_id"
    t.index ["attribute_id", "product_id"], name: "catalogue_productattributeva_attribute_id_3372e4960edf645d_uniq", unique: true
    t.index ["attribute_id"], name: "catalogue_productattributevalue_e582ed73"
    t.index ["entity_content_type_id"], name: "catalogue_productattributevalue_ed18ba79"
    t.index ["product_id"], name: "catalogue_productattributevalue_9bea82de"
    t.index ["value_option_id"], name: "catalogue_productattributevalue_314d12bc"
  end

  create_table "catalogue_productcategory", id: :serial, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "product_id", null: false
    t.index ["category_id"], name: "catalogue_productcategory_b583a629"
    t.index ["product_id", "category_id"], name: "catalogue_productcategory_product_id_5e2d4bf8e6794dc1_uniq", unique: true
    t.index ["product_id"], name: "catalogue_productcategory_9bea82de"
  end

  create_table "catalogue_productclass", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "slug", limit: 128, null: false
    t.boolean "requires_shipping", null: false
    t.boolean "track_stock", null: false
    t.index ["slug"], name: "catalogue_productclass_slug_192c38c37c28fee8_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "catalogue_productclass_slug_key", unique: true
  end

  create_table "catalogue_productclass_options", id: :serial, force: :cascade do |t|
    t.integer "productclass_id", null: false
    t.integer "option_id", null: false
    t.index ["option_id"], name: "catalogue_productclass_options_28df3725"
    t.index ["productclass_id", "option_id"], name: "catalogue_productclass_options_productclass_id_option_id_key", unique: true
    t.index ["productclass_id"], name: "catalogue_productclass_options_ebf7b0c6"
  end

  create_table "catalogue_productimage", id: :serial, force: :cascade do |t|
    t.string "original", limit: 255, null: false
    t.string "caption", limit: 200, null: false
    t.integer "display_order", null: false
    t.datetime "date_created", null: false
    t.integer "product_id", null: false
    t.index ["product_id", "display_order"], name: "catalogue_productimage_product_id_42c337767ef459c7_uniq", unique: true
    t.index ["product_id"], name: "catalogue_productimage_9bea82de"
  end

  create_table "catalogue_productrecommendation", id: :serial, force: :cascade do |t|
    t.integer "ranking", limit: 2, null: false
    t.integer "primary_id", null: false
    t.integer "recommendation_id", null: false
    t.index ["primary_id", "recommendation_id"], name: "catalogue_productrecommendatio_primary_id_1694e35aa7027c55_uniq", unique: true
    t.index ["primary_id"], name: "catalogue_productrecommendation_095f2624"
    t.index ["recommendation_id"], name: "catalogue_productrecommendation_c65d5c4d"
  end

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "manifesto_item_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.boolean "hidden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manifesto_item_id"], name: "index_comments_on_manifesto_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cpl_cplproduct", id: :integer, default: nil, force: :cascade do |t|
    t.string "description", limit: 50, null: false
    t.datetime "date_created", null: false
    t.datetime "date_updated", null: false
  end

  create_table "cpl_cpluser", id: :integer, default: nil, force: :cascade do |t|
    t.string "username", limit: 25, null: false
    t.string "email", limit: 100, null: false
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.datetime "date_created"
    t.integer "user_id", null: false
    t.string "password", limit: 15, null: false
    t.index ["user_id"], name: "cpl_cpluser_e8701ad4"
    t.index ["user_id"], name: "cpl_cpluser_user_id_bfe290e38e379b_uniq", unique: true
  end

  create_table "customer_communicationeventtype", id: :serial, force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "name", limit: 255, null: false
    t.string "category", limit: 255, null: false
    t.string "email_subject_template", limit: 255
    t.text "email_body_template"
    t.text "email_body_html_template"
    t.string "sms_template", limit: 170
    t.datetime "date_created", null: false
    t.datetime "date_updated", null: false
    t.index ["code"], name: "customer_communicationeventtype_code_225fe5069aed87c3_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "customer_communicationeventtype_code_key", unique: true
  end

  create_table "customer_email", id: :serial, force: :cascade do |t|
    t.text "subject", null: false
    t.text "body_text", null: false
    t.text "body_html", null: false
    t.datetime "date_sent", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "customer_email_e8701ad4"
  end

  create_table "customer_notification", id: :serial, force: :cascade do |t|
    t.string "subject", limit: 255, null: false
    t.text "body", null: false
    t.string "category", limit: 255, null: false
    t.string "location", limit: 32, null: false
    t.datetime "date_sent", null: false
    t.datetime "date_read"
    t.integer "recipient_id", null: false
    t.integer "sender_id"
    t.index ["recipient_id"], name: "customer_notification_8b938c66"
    t.index ["sender_id"], name: "customer_notification_924b1846"
  end

  create_table "customer_productalert", id: :serial, force: :cascade do |t|
    t.string "email", limit: 75, null: false
    t.string "key", limit: 128, null: false
    t.string "status", limit: 20, null: false
    t.datetime "date_created", null: false
    t.datetime "date_confirmed"
    t.datetime "date_cancelled"
    t.datetime "date_closed"
    t.integer "product_id", null: false
    t.integer "user_id"
    t.index ["email"], name: "customer_productalert_0c83f57c"
    t.index ["email"], name: "customer_productalert_email_6fa4eb7625e2d9f1_like", opclass: :varchar_pattern_ops
    t.index ["key"], name: "customer_productalert_3c6e0b8a"
    t.index ["key"], name: "customer_productalert_key_6cc81169b09f221c_like", opclass: :varchar_pattern_ops
    t.index ["product_id"], name: "customer_productalert_9bea82de"
    t.index ["user_id"], name: "customer_productalert_e8701ad4"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.datetime "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_417f1b1c"
    t.index ["user_id"], name: "django_admin_log_e8701ad4"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_20fa61c970e671a8_uniq", unique: true
  end

  create_table "django_cron_cronjoblog", id: :serial, force: :cascade do |t|
    t.string "code", limit: 64, null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.boolean "is_success", null: false
    t.text "message", null: false
    t.time "ran_at_time"
    t.index ["code", "is_success", "ran_at_time"], name: "django_cron_cronjoblog_code_7c6776c059a56c85_idx"
    t.index ["code", "start_time", "ran_at_time"], name: "django_cron_cronjoblog_code_522dff7097c4d8b_idx"
    t.index ["code", "start_time"], name: "django_cron_cronjoblog_code_2c3cd2a136f5d405_idx"
    t.index ["code"], name: "django_cron_cronjoblog_c1336794"
    t.index ["code"], name: "django_cron_cronjoblog_code_64dba5a729ee98c6_like", opclass: :varchar_pattern_ops
    t.index ["end_time"], name: "django_cron_cronjoblog_305d2889"
    t.index ["ran_at_time"], name: "django_cron_cronjoblog_a05e4b70"
    t.index ["start_time"], name: "django_cron_cronjoblog_c4d98dbd"
  end

  create_table "django_flatpage", id: :serial, force: :cascade do |t|
    t.string "url", limit: 100, null: false
    t.string "title", limit: 200, null: false
    t.text "content", null: false
    t.boolean "enable_comments", null: false
    t.string "template_name", limit: 70, null: false
    t.boolean "registration_required", null: false
    t.index ["url"], name: "django_flatpage_572d4e42"
    t.index ["url"], name: "django_flatpage_url_3be5d14d099f25ee_like", opclass: :varchar_pattern_ops
  end

  create_table "django_flatpage_sites", id: :serial, force: :cascade do |t|
    t.integer "flatpage_id", null: false
    t.integer "site_id", null: false
    t.index ["flatpage_id", "site_id"], name: "django_flatpage_sites_flatpage_id_site_id_key", unique: true
    t.index ["flatpage_id"], name: "django_flatpage_sites_c3368d3a"
    t.index ["site_id"], name: "django_flatpage_sites_9365d6e7"
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", null: false
    t.index ["expire_date"], name: "django_session_de54fa62"
    t.index ["session_key"], name: "django_session_session_key_17f8433c12b9a9a5_like", opclass: :varchar_pattern_ops
  end

  create_table "django_site", id: :serial, force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name", limit: 50, null: false
  end

  create_table "group_aboutpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_careerpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "short_description", null: false
    t.text "description", null: false
    t.text "desired_skills", null: false
    t.text "reasons_to_join", null: false
    t.string "organisation", limit: 255, null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.index ["detail_image_id"], name: "group_careerpage_25aaae0f"
    t.index ["index_image_id"], name: "group_careerpage_7df979e4"
  end

  create_table "group_careersindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_carepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_contactspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_faqspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_homepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_newsarticle", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "body", null: false
    t.string "strapline", limit: 255, null: false
    t.text "introduction", null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.string "organization", limit: 80, null: false
    t.text "carousel"
    t.datetime "article_date", null: false
    t.index ["detail_image_id"], name: "group_newsarticle_25aaae0f"
    t.index ["index_image_id"], name: "group_newsarticle_7df979e4"
  end

  create_table "group_newsindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_privacypolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_termsandconditionspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "group_trainingpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_aboutpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_careerpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "short_description", null: false
    t.text "description", null: false
    t.text "desired_skills", null: false
    t.text "reasons_to_join", null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.index ["detail_image_id"], name: "hospital_careerpage_25aaae0f"
    t.index ["index_image_id"], name: "hospital_careerpage_7df979e4"
  end

  create_table "hospital_careersindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_condition", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "modality", limit: 40, null: false
    t.text "short_description", null: false
    t.text "introduction", null: false
    t.text "process", null: false
    t.text "team_description", null: false
    t.text "treatments", null: false
    t.integer "icon_id"
    t.integer "inverted_icon_id"
    t.index ["icon_id"], name: "hospital_condition_fe6647e8"
    t.index ["inverted_icon_id"], name: "hospital_condition_1b886303"
  end

  create_table "hospital_conditiondocument", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "document_id", null: false
    t.integer "page_id", null: false
    t.index ["document_id"], name: "hospital_conditiondocument_e7fafc10"
    t.index ["page_id"], name: "hospital_conditiondocument_1a63c800"
  end

  create_table "hospital_conditionindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_contactspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_equipment", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "description", null: false
    t.text "benefits", null: false
    t.text "for_whom", null: false
    t.string "website", limit: 2083, null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.text "short_description", null: false
    t.index ["detail_image_id"], name: "hospital_equipment_25aaae0f"
    t.index ["index_image_id"], name: "hospital_equipment_7df979e4"
  end

  create_table "hospital_equipmentindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_equipmenttag", id: :serial, force: :cascade do |t|
    t.integer "content_object_id", null: false
    t.integer "tag_id", null: false
    t.index ["content_object_id"], name: "hospital_equipmenttag_09a80f33"
    t.index ["tag_id"], name: "hospital_equipmenttag_76f094bc"
  end

  create_table "hospital_facilityindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_faqspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_homepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_homepagefeaturedcareservice", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "care_service_id", null: false
    t.integer "page_id", null: false
    t.index ["care_service_id"], name: "hospital_homepagefeaturedcareservice_da5d0ed7"
    t.index ["page_id"], name: "hospital_homepagefeaturedcareservice_1a63c800"
  end

  create_table "hospital_privacypolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_staffindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_staffmember", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "job_title", limit: 60, null: false
    t.text "description", null: false
    t.integer "profile_photo_id"
    t.text "short_description", null: false
    t.string "linkedin_url", limit: 2083, null: false
    t.string "twitter_url", limit: 2083, null: false
    t.index ["profile_photo_id"], name: "hospital_staffmember_1c716876"
  end

  create_table "hospital_termsandconditionspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "hospital_treatment", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "modality", limit: 40, null: false
    t.text "short_description", null: false
    t.text "introduction", null: false
    t.text "process", null: false
    t.text "team_description", null: false
    t.text "conditions_treated", null: false
    t.integer "icon_id"
    t.integer "inverted_icon_id"
    t.index ["icon_id"], name: "hospital_treatment_fe6647e8"
    t.index ["inverted_icon_id"], name: "hospital_treatment_1b886303"
  end

  create_table "hospital_treatmentdocument", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "document_id", null: false
    t.integer "page_id", null: false
    t.index ["document_id"], name: "hospital_treatmentdocument_e7fafc10"
    t.index ["page_id"], name: "hospital_treatmentdocument_1a63c800"
  end

  create_table "hospital_treatmentindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_aboutpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_admissionpolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_condition", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "modality", limit: 40, null: false
    t.text "short_description", null: false
    t.text "introduction", null: false
    t.text "process", null: false
    t.text "team_description", null: false
    t.text "treatments", null: false
    t.integer "icon_id"
    t.integer "inverted_icon_id"
    t.index ["icon_id"], name: "lodge_condition_fe6647e8"
    t.index ["inverted_icon_id"], name: "lodge_condition_1b886303"
  end

  create_table "lodge_conditiondocument", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "document_id", null: false
    t.integer "page_id", null: false
    t.index ["document_id"], name: "lodge_conditiondocument_e7fafc10"
    t.index ["page_id"], name: "lodge_conditiondocument_1a63c800"
  end

  create_table "lodge_contactspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_facilitiespage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_faqspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_homepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_homepagefeaturedcondition", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "condition_id", null: false
    t.integer "page_id", null: false
    t.index ["condition_id"], name: "lodge_homepagefeaturedcondition_bb531585"
    t.index ["page_id"], name: "lodge_homepagefeaturedcondition_1a63c800"
  end

  create_table "lodge_lifestylepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_patientcarepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_privacypolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_staffindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "lodge_staffmember", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "job_title", limit: 60, null: false
    t.text "description", null: false
    t.integer "profile_photo_id"
    t.text "short_description", null: false
    t.string "linkedin_url", limit: 2083, null: false
    t.string "twitter_url", limit: 2083, null: false
    t.index ["profile_photo_id"], name: "lodge_staffmember_1c716876"
  end

  create_table "lodge_termsandconditionspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "manifesto_items", force: :cascade do |t|
    t.bigint "manifesto_section_id", null: false
    t.string "kind"
    t.integer "position"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "item_type"
    t.bigint "manifesto_item_id"
    t.string "digest"
    t.integer "version"
    t.integer "comments_count"
    t.bigint "annotation_id"
    t.index ["annotation_id"], name: "index_manifesto_items_on_annotation_id"
    t.index ["manifesto_item_id"], name: "index_manifesto_items_on_manifesto_item_id"
    t.index ["manifesto_section_id"], name: "index_manifesto_items_on_manifesto_section_id"
  end

  create_table "manifesto_sections", force: :cascade do |t|
    t.bigint "manifesto_id", null: false
    t.bigint "manifesto_section_id"
    t.integer "position"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "version", default: 1
    t.text "document_source"
    t.index ["manifesto_id"], name: "index_manifesto_sections_on_manifesto_id"
    t.index ["manifesto_section_id"], name: "index_manifesto_sections_on_manifesto_section_id"
  end

  create_table "manifestos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "party_id"
    t.index ["party_id"], name: "index_manifestos_on_party_id"
  end

  create_table "offer_benefit", id: :serial, force: :cascade do |t|
    t.string "type", limit: 128, null: false
    t.decimal "value", precision: 12, scale: 2
    t.integer "max_affected_items"
    t.string "proxy_class", limit: 255
    t.integer "range_id"
    t.index ["proxy_class"], name: "offer_benefit_proxy_class_c7e5a9584ea9572_like", opclass: :varchar_pattern_ops
    t.index ["proxy_class"], name: "offer_benefit_proxy_class_key", unique: true
    t.index ["range_id"], name: "offer_benefit_ee6537b7"
  end

  create_table "offer_condition", id: :serial, force: :cascade do |t|
    t.string "type", limit: 128, null: false
    t.decimal "value", precision: 12, scale: 2
    t.string "proxy_class", limit: 255
    t.integer "range_id"
    t.index ["proxy_class"], name: "offer_condition_proxy_class_23fd2cc2fc054f56_like", opclass: :varchar_pattern_ops
    t.index ["proxy_class"], name: "offer_condition_proxy_class_key", unique: true
    t.index ["range_id"], name: "offer_condition_ee6537b7"
  end

  create_table "offer_conditionaloffer", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "slug", limit: 128, null: false
    t.text "description", null: false
    t.string "offer_type", limit: 128, null: false
    t.string "status", limit: 64, null: false
    t.integer "priority", null: false
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.integer "max_global_applications"
    t.integer "max_user_applications"
    t.integer "max_basket_applications"
    t.decimal "max_discount", precision: 12, scale: 2
    t.decimal "total_discount", precision: 12, scale: 2, null: false
    t.integer "num_applications", null: false
    t.integer "num_orders", null: false
    t.string "redirect_url", limit: 200, null: false
    t.datetime "date_created", null: false
    t.integer "benefit_id", null: false
    t.integer "condition_id", null: false
    t.index ["benefit_id"], name: "offer_conditionaloffer_326fa416"
    t.index ["condition_id"], name: "offer_conditionaloffer_bb531585"
    t.index ["name"], name: "offer_conditionaloffer_name_2214784dea4b32d9_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "offer_conditionaloffer_name_key", unique: true
    t.index ["slug"], name: "offer_conditionaloffer_slug_1393cec7cf959cee_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "offer_conditionaloffer_slug_key", unique: true
  end

  create_table "offer_range", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "slug", limit: 128, null: false
    t.text "description", null: false
    t.boolean "is_public", null: false
    t.boolean "includes_all_products", null: false
    t.string "proxy_class", limit: 255
    t.datetime "date_created", null: false
    t.index ["name"], name: "offer_range_name_32410453f061a777_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "offer_range_name_key", unique: true
    t.index ["proxy_class"], name: "offer_range_proxy_class_4cf63d86ac5c9b83_like", opclass: :varchar_pattern_ops
    t.index ["proxy_class"], name: "offer_range_proxy_class_key", unique: true
    t.index ["slug"], name: "offer_range_slug_68b9f7b1b8517e22_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "offer_range_slug_key", unique: true
  end

  create_table "offer_range_classes", id: :serial, force: :cascade do |t|
    t.integer "range_id", null: false
    t.integer "productclass_id", null: false
    t.index ["productclass_id"], name: "offer_range_classes_ebf7b0c6"
    t.index ["range_id", "productclass_id"], name: "offer_range_classes_range_id_productclass_id_key", unique: true
    t.index ["range_id"], name: "offer_range_classes_ee6537b7"
  end

  create_table "offer_range_excluded_products", id: :serial, force: :cascade do |t|
    t.integer "range_id", null: false
    t.integer "product_id", null: false
    t.index ["product_id"], name: "offer_range_excluded_products_9bea82de"
    t.index ["range_id", "product_id"], name: "offer_range_excluded_products_range_id_product_id_key", unique: true
    t.index ["range_id"], name: "offer_range_excluded_products_ee6537b7"
  end

  create_table "offer_range_included_categories", id: :serial, force: :cascade do |t|
    t.integer "range_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "offer_range_included_categories_b583a629"
    t.index ["range_id", "category_id"], name: "offer_range_included_categories_range_id_category_id_key", unique: true
    t.index ["range_id"], name: "offer_range_included_categories_ee6537b7"
  end

  create_table "offer_rangeproduct", id: :serial, force: :cascade do |t|
    t.integer "display_order", null: false
    t.integer "product_id", null: false
    t.integer "range_id", null: false
    t.index ["product_id"], name: "offer_rangeproduct_9bea82de"
    t.index ["range_id", "product_id"], name: "offer_rangeproduct_range_id_4527fa75bf2dc2c9_uniq", unique: true
    t.index ["range_id"], name: "offer_rangeproduct_ee6537b7"
  end

  create_table "offer_rangeproductfileupload", id: :serial, force: :cascade do |t|
    t.string "filepath", limit: 255, null: false
    t.integer "size", null: false
    t.datetime "date_uploaded", null: false
    t.string "status", limit: 32, null: false
    t.string "error_message", limit: 255, null: false
    t.datetime "date_processed"
    t.integer "num_new_skus"
    t.integer "num_unknown_skus"
    t.integer "num_duplicate_skus"
    t.integer "range_id", null: false
    t.integer "uploaded_by_id", null: false
    t.index ["range_id"], name: "offer_rangeproductfileupload_ee6537b7"
    t.index ["uploaded_by_id"], name: "offer_rangeproductfileupload_4095e96b"
  end

  create_table "order_billingaddress", id: :serial, force: :cascade do |t|
    t.string "title", limit: 64, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "line1", limit: 255, null: false
    t.string "line2", limit: 255, null: false
    t.string "line3", limit: 255, null: false
    t.string "line4", limit: 255, null: false
    t.string "state", limit: 255, null: false
    t.string "postcode", limit: 64, null: false
    t.text "search_text", null: false
    t.string "country_id", limit: 2, null: false
    t.string "company", limit: 255, null: false
    t.string "eu_vat", limit: 14, null: false
    t.string "phone_number", limit: 128, null: false
    t.index ["country_id"], name: "order_billingaddress_93bfec8a"
    t.index ["country_id"], name: "order_billingaddress_country_id_56c3b87c475ee23b_like", opclass: :varchar_pattern_ops
  end

  create_table "order_communicationevent", id: :serial, force: :cascade do |t|
    t.datetime "date_created", null: false
    t.integer "event_type_id", null: false
    t.integer "order_id", null: false
    t.index ["event_type_id"], name: "order_communicationevent_5e891baf"
    t.index ["order_id"], name: "order_communicationevent_69dfcb07"
  end

  create_table "order_line", id: :serial, force: :cascade do |t|
    t.string "partner_name", limit: 128, null: false
    t.string "partner_sku", limit: 128, null: false
    t.string "partner_line_reference", limit: 128, null: false
    t.text "partner_line_notes", null: false
    t.string "title", limit: 255, null: false
    t.string "upc", limit: 128
    t.integer "quantity", null: false
    t.decimal "line_price_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "line_price_excl_tax", precision: 12, scale: 2, null: false
    t.decimal "line_price_before_discounts_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "line_price_before_discounts_excl_tax", precision: 12, scale: 2, null: false
    t.decimal "unit_cost_price", precision: 12, scale: 2
    t.decimal "unit_price_incl_tax", precision: 12, scale: 2
    t.decimal "unit_price_excl_tax", precision: 12, scale: 2
    t.decimal "unit_retail_price", precision: 12, scale: 2
    t.string "status", limit: 255, null: false
    t.date "est_dispatch_date"
    t.integer "order_id", null: false
    t.integer "partner_id"
    t.integer "product_id"
    t.integer "stockrecord_id"
    t.index ["order_id"], name: "order_line_69dfcb07"
    t.index ["partner_id"], name: "order_line_4e98b6eb"
    t.index ["product_id"], name: "order_line_9bea82de"
    t.index ["stockrecord_id"], name: "order_line_271c5733"
  end

  create_table "order_lineattribute", id: :serial, force: :cascade do |t|
    t.string "type", limit: 128, null: false
    t.string "value", limit: 255, null: false
    t.integer "line_id", null: false
    t.integer "option_id"
    t.index ["line_id"], name: "order_lineattribute_b3ae486a"
    t.index ["option_id"], name: "order_lineattribute_28df3725"
  end

  create_table "order_lineprice", id: :serial, force: :cascade do |t|
    t.integer "quantity", null: false
    t.decimal "price_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "price_excl_tax", precision: 12, scale: 2, null: false
    t.decimal "shipping_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "shipping_excl_tax", precision: 12, scale: 2, null: false
    t.integer "line_id", null: false
    t.integer "order_id", null: false
    t.index ["line_id"], name: "order_lineprice_b3ae486a"
    t.index ["order_id"], name: "order_lineprice_69dfcb07"
  end

  create_table "order_order", id: :serial, force: :cascade do |t|
    t.string "number", limit: 128, null: false
    t.string "currency", limit: 12, null: false
    t.decimal "total_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "total_excl_tax", precision: 12, scale: 2, null: false
    t.decimal "shipping_incl_tax", precision: 12, scale: 2, null: false
    t.decimal "shipping_excl_tax", precision: 12, scale: 2, null: false
    t.string "shipping_method", limit: 128, null: false
    t.string "shipping_code", limit: 128, null: false
    t.string "status", limit: 100, null: false
    t.string "guest_email", limit: 75, null: false
    t.datetime "date_placed", null: false
    t.integer "basket_id"
    t.integer "billing_address_id"
    t.integer "shipping_address_id"
    t.integer "site_id"
    t.integer "user_id"
    t.index ["basket_id"], name: "order_order_afdeaea9"
    t.index ["billing_address_id"], name: "order_order_e9192ced"
    t.index ["date_placed"], name: "order_order_90e84921"
    t.index ["number"], name: "order_order_number_4ce9ec18b12e23e6_like", opclass: :varchar_pattern_ops
    t.index ["number"], name: "order_order_number_key", unique: true
    t.index ["shipping_address_id"], name: "order_order_8fb9ffec"
    t.index ["site_id"], name: "order_order_9365d6e7"
    t.index ["user_id"], name: "order_order_e8701ad4"
  end

  create_table "order_orderdiscount", id: :serial, force: :cascade do |t|
    t.string "category", limit: 64, null: false
    t.integer "offer_id"
    t.string "offer_name", limit: 128, null: false
    t.integer "voucher_id"
    t.string "voucher_code", limit: 128, null: false
    t.integer "frequency"
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.text "message", null: false
    t.integer "order_id", null: false
    t.index ["offer_name"], name: "order_orderdiscount_9eeed246"
    t.index ["offer_name"], name: "order_orderdiscount_offer_name_243528b338a1085d_like", opclass: :varchar_pattern_ops
    t.index ["order_id"], name: "order_orderdiscount_69dfcb07"
    t.index ["voucher_code"], name: "order_orderdiscount_08e4f7cd"
    t.index ["voucher_code"], name: "order_orderdiscount_voucher_code_e000189b3005af8_like", opclass: :varchar_pattern_ops
  end

  create_table "order_ordernote", id: :serial, force: :cascade do |t|
    t.string "note_type", limit: 128, null: false
    t.text "message", null: false
    t.datetime "date_created", null: false
    t.datetime "date_updated", null: false
    t.integer "order_id", null: false
    t.integer "user_id"
    t.index ["order_id"], name: "order_ordernote_69dfcb07"
    t.index ["user_id"], name: "order_ordernote_e8701ad4"
  end

  create_table "order_paymentevent", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.string "reference", limit: 128, null: false
    t.datetime "date_created", null: false
    t.integer "event_type_id", null: false
    t.integer "order_id", null: false
    t.integer "shipping_event_id"
    t.index ["event_type_id"], name: "order_paymentevent_5e891baf"
    t.index ["order_id"], name: "order_paymentevent_69dfcb07"
    t.index ["shipping_event_id"], name: "order_paymentevent_78cafb71"
  end

  create_table "order_paymenteventquantity", id: :serial, force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "event_id", null: false
    t.integer "line_id", null: false
    t.index ["event_id", "line_id"], name: "order_paymenteventquantity_event_id_5bff773d14086800_uniq", unique: true
    t.index ["event_id"], name: "order_paymenteventquantity_4437cfac"
    t.index ["line_id"], name: "order_paymenteventquantity_b3ae486a"
  end

  create_table "order_paymenteventtype", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 128, null: false
    t.index ["code"], name: "order_paymenteventtype_code_4f568c95dfea5ca7_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "order_paymenteventtype_code_key", unique: true
    t.index ["name"], name: "order_paymenteventtype_name_30afa63c20f1457f_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "order_paymenteventtype_name_key", unique: true
  end

  create_table "order_shippingaddress", id: :serial, force: :cascade do |t|
    t.string "title", limit: 64, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "line1", limit: 255, null: false
    t.string "line2", limit: 255, null: false
    t.string "line3", limit: 255, null: false
    t.string "line4", limit: 255, null: false
    t.string "state", limit: 255, null: false
    t.string "postcode", limit: 64, null: false
    t.text "search_text", null: false
    t.string "phone_number", limit: 128, null: false
    t.text "notes", null: false
    t.string "country_id", limit: 2, null: false
    t.index ["country_id"], name: "order_shippingaddress_93bfec8a"
    t.index ["country_id"], name: "order_shippingaddress_country_id_3d3681191865f92d_like", opclass: :varchar_pattern_ops
  end

  create_table "order_shippingevent", id: :serial, force: :cascade do |t|
    t.text "notes", null: false
    t.datetime "date_created", null: false
    t.integer "event_type_id", null: false
    t.integer "order_id", null: false
    t.index ["event_type_id"], name: "order_shippingevent_5e891baf"
    t.index ["order_id"], name: "order_shippingevent_69dfcb07"
  end

  create_table "order_shippingeventquantity", id: :serial, force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "event_id", null: false
    t.integer "line_id", null: false
    t.index ["event_id", "line_id"], name: "order_shippingeventquantity_event_id_4d22a1fd92d4dee0_uniq", unique: true
    t.index ["event_id"], name: "order_shippingeventquantity_4437cfac"
    t.index ["line_id"], name: "order_shippingeventquantity_b3ae486a"
  end

  create_table "order_shippingeventtype", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "code", limit: 128, null: false
    t.index ["code"], name: "order_shippingeventtype_code_5c5ecbf6b4a89dff_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "order_shippingeventtype_code_key", unique: true
    t.index ["name"], name: "order_shippingeventtype_name_744bfc9007b1b227_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "order_shippingeventtype_name_key", unique: true
  end

  create_table "parties", force: :cascade do |t|
    t.string "acronym"
    t.string "logo"
    t.string "name"
    t.string "website"
    t.string "email"
    t.text "description"
    t.string "description_source"
    t.date "description_updated_at"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "partner_partner", id: :serial, force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "name", limit: 128, null: false
    t.index ["code"], name: "partner_partner_code_1c75b113cf6c652d_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "partner_partner_code_key", unique: true
  end

  create_table "partner_partner_users", id: :serial, force: :cascade do |t|
    t.integer "partner_id", null: false
    t.integer "user_id", null: false
    t.index ["partner_id", "user_id"], name: "partner_partner_users_partner_id_user_id_key", unique: true
    t.index ["partner_id"], name: "partner_partner_users_4e98b6eb"
    t.index ["user_id"], name: "partner_partner_users_e8701ad4"
  end

  create_table "partner_partneraddress", id: :serial, force: :cascade do |t|
    t.string "title", limit: 64, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "line1", limit: 255, null: false
    t.string "line2", limit: 255, null: false
    t.string "line3", limit: 255, null: false
    t.string "line4", limit: 255, null: false
    t.string "state", limit: 255, null: false
    t.string "postcode", limit: 64, null: false
    t.text "search_text", null: false
    t.string "country_id", limit: 2, null: false
    t.integer "partner_id", null: false
    t.index ["country_id"], name: "partner_partneraddress_93bfec8a"
    t.index ["country_id"], name: "partner_partneraddress_country_id_223e5808688af75a_like", opclass: :varchar_pattern_ops
    t.index ["partner_id"], name: "partner_partneraddress_4e98b6eb"
  end

  create_table "partner_stockalert", id: :serial, force: :cascade do |t|
    t.integer "threshold", null: false
    t.string "status", limit: 128, null: false
    t.datetime "date_created", null: false
    t.datetime "date_closed"
    t.integer "stockrecord_id", null: false
    t.index ["stockrecord_id"], name: "partner_stockalert_271c5733"
  end

  create_table "partner_stockrecord", id: :serial, force: :cascade do |t|
    t.string "partner_sku", limit: 128, null: false
    t.string "price_currency", limit: 12, null: false
    t.decimal "price_excl_tax", precision: 12, scale: 2
    t.decimal "price_retail", precision: 12, scale: 2
    t.decimal "cost_price", precision: 12, scale: 2
    t.integer "num_in_stock"
    t.integer "num_allocated"
    t.integer "low_stock_threshold"
    t.datetime "date_created", null: false
    t.datetime "date_updated", null: false
    t.integer "partner_id", null: false
    t.integer "product_id", null: false
    t.index ["date_updated"], name: "partner_stockrecord_9474e4b5"
    t.index ["partner_id", "partner_sku"], name: "partner_stockrecord_partner_id_6f42ae47c7160744_uniq", unique: true
    t.index ["partner_id"], name: "partner_stockrecord_4e98b6eb"
    t.index ["product_id"], name: "partner_stockrecord_9bea82de"
  end

  create_table "payment_bankcard", id: :serial, force: :cascade do |t|
    t.string "card_type", limit: 128, null: false
    t.string "name", limit: 255, null: false
    t.string "number", limit: 32, null: false
    t.date "expiry_date", null: false
    t.string "partner_reference", limit: 255, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "payment_bankcard_e8701ad4"
  end

  create_table "payment_source", id: :serial, force: :cascade do |t|
    t.string "currency", limit: 12, null: false
    t.decimal "amount_allocated", precision: 12, scale: 2, null: false
    t.decimal "amount_debited", precision: 12, scale: 2, null: false
    t.decimal "amount_refunded", precision: 12, scale: 2, null: false
    t.string "reference", limit: 128, null: false
    t.string "label", limit: 128, null: false
    t.integer "order_id", null: false
    t.integer "source_type_id", null: false
    t.index ["order_id"], name: "payment_source_69dfcb07"
    t.index ["source_type_id"], name: "payment_source_ed5cb66b"
  end

  create_table "payment_sourcetype", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 128, null: false
    t.index ["code"], name: "payment_sourcetype_code_57a491f62db9b865_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "payment_sourcetype_code_key", unique: true
  end

  create_table "payment_transaction", id: :serial, force: :cascade do |t|
    t.string "txn_type", limit: 128, null: false
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.string "reference", limit: 128, null: false
    t.string "status", limit: 128, null: false
    t.datetime "date_created", null: false
    t.integer "source_id", null: false
    t.index ["source_id"], name: "payment_transaction_0afd9202"
  end

  create_table "paypal_expresstransaction", id: :serial, force: :cascade do |t|
    t.text "raw_request", null: false
    t.text "raw_response", null: false
    t.float "response_time", null: false
    t.datetime "date_created", null: false
    t.string "method", limit: 32, null: false
    t.string "version", limit: 8, null: false
    t.decimal "amount", precision: 12, scale: 2
    t.string "currency", limit: 8
    t.string "ack", limit: 32, null: false
    t.string "correlation_id", limit: 32
    t.string "token", limit: 32
    t.string "error_code", limit: 32
    t.string "error_message", limit: 256
  end

  create_table "paypal_payflowtransaction", id: :serial, force: :cascade do |t|
    t.text "raw_request", null: false
    t.text "raw_response", null: false
    t.float "response_time", null: false
    t.datetime "date_created", null: false
    t.string "comment1", limit: 128, null: false
    t.string "trxtype", limit: 12, null: false
    t.string "tender", limit: 12
    t.decimal "amount", precision: 12, scale: 2
    t.string "pnref", limit: 32
    t.string "ppref", limit: 32
    t.string "result", limit: 32
    t.string "respmsg", limit: 512, null: false
    t.string "authcode", limit: 32
    t.string "cvv2match", limit: 12
    t.string "avsaddr", limit: 1
    t.string "avszip", limit: 1
    t.index ["comment1"], name: "paypal_payflowtransaction_4e83d0f4"
    t.index ["comment1"], name: "paypal_payflowtransaction_comment1_3d28f10b3bf77492_like", opclass: :varchar_pattern_ops
    t.index ["ppref"], name: "paypal_payflowtransaction_ppref_6d68a837c5aeb208_like", opclass: :varchar_pattern_ops
    t.index ["ppref"], name: "paypal_payflowtransaction_ppref_key", unique: true
  end

  create_table "promotions_automaticproductlist", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.string "link_url", limit: 200, null: false
    t.string "link_text", limit: 255, null: false
    t.datetime "date_created", null: false
    t.string "method", limit: 128, null: false
    t.integer "num_products", limit: 2, null: false
  end

  create_table "promotions_handpickedproductlist", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.string "link_url", limit: 200, null: false
    t.string "link_text", limit: 255, null: false
    t.datetime "date_created", null: false
  end

  create_table "promotions_image", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "link_url", limit: 200, null: false
    t.string "image", limit: 255, null: false
    t.datetime "date_created", null: false
  end

  create_table "promotions_keywordpromotion", id: :serial, force: :cascade do |t|
    t.integer "object_id", null: false
    t.string "position", limit: 100, null: false
    t.integer "display_order", null: false
    t.integer "clicks", null: false
    t.datetime "date_created", null: false
    t.string "keyword", limit: 200, null: false
    t.string "filter", limit: 200, null: false
    t.integer "content_type_id", null: false
    t.index ["content_type_id"], name: "promotions_keywordpromotion_417f1b1c"
  end

  create_table "promotions_multiimage", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.datetime "date_created", null: false
  end

  create_table "promotions_multiimage_images", id: :serial, force: :cascade do |t|
    t.integer "multiimage_id", null: false
    t.integer "image_id", null: false
    t.index ["image_id"], name: "promotions_multiimage_images_f33175e6"
    t.index ["multiimage_id", "image_id"], name: "promotions_multiimage_images_multiimage_id_image_id_key", unique: true
    t.index ["multiimage_id"], name: "promotions_multiimage_images_8f22ac31"
  end

  create_table "promotions_orderedproduct", id: :serial, force: :cascade do |t|
    t.integer "display_order", null: false
    t.integer "list_id", null: false
    t.integer "product_id", null: false
    t.index ["list_id", "product_id"], name: "promotions_orderedproduct_list_id_48b62e1808d5ef6b_uniq", unique: true
    t.index ["list_id"], name: "promotions_orderedproduct_4da3e820"
    t.index ["product_id"], name: "promotions_orderedproduct_9bea82de"
  end

  create_table "promotions_orderedproductlist", primary_key: "handpickedproductlist_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "display_order", null: false
    t.integer "tabbed_block_id", null: false
    t.index ["tabbed_block_id"], name: "promotions_orderedproductlist_1f46f425"
  end

  create_table "promotions_pagepromotion", id: :serial, force: :cascade do |t|
    t.integer "object_id", null: false
    t.string "position", limit: 100, null: false
    t.integer "display_order", null: false
    t.integer "clicks", null: false
    t.datetime "date_created", null: false
    t.string "page_url", limit: 128, null: false
    t.integer "content_type_id", null: false
    t.index ["content_type_id"], name: "promotions_pagepromotion_417f1b1c"
    t.index ["page_url"], name: "promotions_pagepromotion_072c6e88"
    t.index ["page_url"], name: "promotions_pagepromotion_page_url_107b3abaf8bdfae_like", opclass: :varchar_pattern_ops
  end

  create_table "promotions_rawhtml", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "display_type", limit: 128, null: false
    t.text "body", null: false
    t.datetime "date_created", null: false
  end

  create_table "promotions_singleproduct", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.text "description", null: false
    t.datetime "date_created", null: false
    t.integer "product_id", null: false
    t.index ["product_id"], name: "promotions_singleproduct_9bea82de"
  end

  create_table "promotions_tabbedblock", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "date_created", null: false
  end

  create_table "reviews_productreview", id: :serial, force: :cascade do |t|
    t.integer "score", limit: 2, null: false
    t.string "title", limit: 255, null: false
    t.text "body", null: false
    t.string "name", limit: 255, null: false
    t.string "email", limit: 75, null: false
    t.string "homepage", limit: 200, null: false
    t.integer "status", limit: 2, null: false
    t.integer "total_votes", null: false
    t.integer "delta_votes", null: false
    t.datetime "date_created", null: false
    t.integer "product_id"
    t.integer "user_id"
    t.index ["delta_votes"], name: "reviews_productreview_979acfd1"
    t.index ["product_id", "user_id"], name: "reviews_productreview_product_id_489631117c3e7bc7_uniq", unique: true
    t.index ["product_id"], name: "reviews_productreview_9bea82de"
    t.index ["user_id"], name: "reviews_productreview_e8701ad4"
  end

  create_table "reviews_vote", id: :serial, force: :cascade do |t|
    t.integer "delta", limit: 2, null: false
    t.datetime "date_created", null: false
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.index ["review_id"], name: "reviews_vote_5bd2a989"
    t.index ["user_id", "review_id"], name: "reviews_vote_user_id_73dcf52befa4f1e4_uniq", unique: true
    t.index ["user_id"], name: "reviews_vote_e8701ad4"
  end

  create_table "shipping_orderanditemcharges", id: :serial, force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "name", limit: 128, null: false
    t.text "description", null: false
    t.decimal "price_per_order", precision: 12, scale: 2, null: false
    t.decimal "price_per_item", precision: 12, scale: 2, null: false
    t.decimal "free_shipping_threshold", precision: 12, scale: 2
    t.index ["code"], name: "shipping_orderanditemcharges_code_1d9919178e382edf_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "shipping_orderanditemcharges_code_key", unique: true
    t.index ["name"], name: "shipping_orderanditemcharges_name_20012adc641c2e87_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "shipping_orderanditemcharges_name_key", unique: true
  end

  create_table "shipping_orderanditemcharges_countries", id: :serial, force: :cascade do |t|
    t.integer "orderanditemcharges_id", null: false
    t.string "country_id", limit: 2, null: false
    t.index ["country_id"], name: "shipping_orderanditemcharges_c_country_id_2035fdd696211879_like", opclass: :varchar_pattern_ops
    t.index ["country_id"], name: "shipping_orderanditemcharges_countries_93bfec8a"
    t.index ["orderanditemcharges_id", "country_id"], name: "shipping_orderanditemcharges__orderanditemcharges_id_countr_key", unique: true
    t.index ["orderanditemcharges_id"], name: "shipping_orderanditemcharges_countries_2e9e2d8d"
  end

  create_table "shipping_weightband", id: :serial, force: :cascade do |t|
    t.decimal "upper_limit", precision: 12, scale: 3, null: false
    t.decimal "charge", precision: 12, scale: 2, null: false
    t.integer "method_id", null: false
    t.index ["method_id"], name: "shipping_weightband_836f12fb"
  end

  create_table "shipping_weightbased", id: :serial, force: :cascade do |t|
    t.string "code", limit: 128, null: false
    t.string "name", limit: 128, null: false
    t.text "description", null: false
    t.decimal "default_weight", precision: 12, scale: 3, null: false
    t.index ["code"], name: "shipping_weightbased_code_b2bf4f82d3e00b0_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "shipping_weightbased_code_key", unique: true
    t.index ["name"], name: "shipping_weightbased_name_5ad63aea92bc92a_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "shipping_weightbased_name_key", unique: true
  end

  create_table "shipping_weightbased_countries", id: :serial, force: :cascade do |t|
    t.integer "weightbased_id", null: false
    t.string "country_id", limit: 2, null: false
    t.index ["country_id"], name: "shipping_weightbased_countries_93bfec8a"
    t.index ["country_id"], name: "shipping_weightbased_countries_country_id_67d32ca0ffef52b5_like", opclass: :varchar_pattern_ops
    t.index ["weightbased_id", "country_id"], name: "shipping_weightbased_countries_weightbased_id_country_id_key", unique: true
    t.index ["weightbased_id"], name: "shipping_weightbased_countries_30de71ed"
  end

  create_table "taggit_tag", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "slug", limit: 100, null: false
    t.index ["name"], name: "taggit_tag_name_7186e4917bd9c768_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "taggit_tag_name_key", unique: true
    t.index ["slug"], name: "taggit_tag_slug_8725a41d88e9e0b_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "taggit_tag_slug_key", unique: true
  end

  create_table "taggit_taggeditem", id: :serial, force: :cascade do |t|
    t.integer "object_id", null: false
    t.integer "content_type_id", null: false
    t.integer "tag_id", null: false
    t.index ["content_type_id", "object_id"], name: "taggit_taggeditem_content_type_id_549aa1185fc8b30e_idx"
    t.index ["content_type_id"], name: "taggit_taggeditem_417f1b1c"
    t.index ["object_id"], name: "taggit_taggeditem_af31437c"
    t.index ["tag_id"], name: "taggit_taggeditem_76f094bc"
  end

  create_table "thumbnail_kvstore", primary_key: "key", id: :string, limit: 200, force: :cascade do |t|
    t.text "value", null: false
    t.index ["key"], name: "thumbnail_kvstore_key_661738d886f10e8b_like", opclass: :varchar_pattern_ops
  end

  create_table "training_aboutpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_affinitytraininglandingpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_carecertificatecourseindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_careerpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "short_description", null: false
    t.text "description", null: false
    t.text "desired_skills", null: false
    t.text "reasons_to_join", null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.index ["detail_image_id"], name: "training_careerpage_25aaae0f"
    t.index ["index_image_id"], name: "training_careerpage_7df979e4"
  end

  create_table "training_careersindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_cityandguildspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_contactspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_course", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "modality", limit: 40, null: false
    t.text "short_description", null: false
    t.text "introduction", null: false
    t.text "objectives", null: false
    t.text "summary", null: false
    t.boolean "recommended", null: false
    t.boolean "guilds_endorsed", null: false
    t.integer "course_product_id"
    t.integer "icon_id"
    t.integer "inverted_icon_id"
    t.string "accreditation", limit: 40, null: false
    t.index ["course_product_id"], name: "training_course_259216d8"
    t.index ["icon_id"], name: "training_course_fe6647e8"
    t.index ["inverted_icon_id"], name: "training_course_1b886303"
  end

  create_table "training_coursedocument", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "document_id", null: false
    t.integer "page_id", null: false
    t.index ["document_id"], name: "training_coursedocument_e7fafc10"
    t.index ["page_id"], name: "training_coursedocument_1a63c800"
  end

  create_table "training_courseindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_courseinformationpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_coursereview", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.text "body", null: false
    t.string "author_name", limit: 255, null: false
    t.datetime "reviewed_at", null: false
    t.integer "page_id", null: false
    t.index ["page_id"], name: "training_coursereview_1a63c800"
  end

  create_table "training_coursesession", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.string "date", limit: 255, null: false
    t.string "time", limit: 255, null: false
    t.string "venue", limit: 255, null: false
    t.integer "page_id", null: false
    t.string "title", limit: 255, null: false
    t.index ["page_id"], name: "training_coursesession_1a63c800"
  end

  create_table "training_dementiacourseindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_faqspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_formpage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "header", null: false
    t.text "introduction", null: false
    t.text "body", null: false
    t.string "cta_title", limit: 30, null: false
    t.string "cta_description", limit: 255, null: false
    t.string "cta_btn_label", limit: 30, null: false
    t.string "form_title", limit: 255, null: false
    t.string "form_subtitle", limit: 255, null: false
    t.text "form_success_msg", null: false
  end

  create_table "training_formpageformfield", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.string "label", limit: 255, null: false
    t.string "field_type", limit: 16, null: false
    t.boolean "required", null: false
    t.string "choices", limit: 512, null: false
    t.string "default_value", limit: 255, null: false
    t.string "help_text", limit: 255, null: false
    t.integer "page_id", null: false
    t.index ["page_id"], name: "training_formpageformfield_1a63c800"
  end

  create_table "training_homepage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "main_carousel"
  end

  create_table "training_homepagefeaturedcourse", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.integer "course_id", null: false
    t.integer "page_id", null: false
    t.index ["course_id"], name: "training_homepagefeaturedcourse_ea134da7"
    t.index ["page_id"], name: "training_homepagefeaturedcourse_1a63c800"
  end

  create_table "training_lmspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_newsarticle", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "body", null: false
    t.text "carousel"
    t.string "strapline", limit: 255, null: false
    t.text "introduction", null: false
    t.integer "detail_image_id"
    t.integer "index_image_id"
    t.datetime "article_date", null: false
    t.index ["detail_image_id"], name: "training_newsarticle_25aaae0f"
    t.index ["index_image_id"], name: "training_newsarticle_7df979e4"
  end

  create_table "training_newsindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_privacypolicypage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_staffindex", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "training_staffmember", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "job_title", limit: 60, null: false
    t.text "description", null: false
    t.integer "profile_photo_id"
    t.text "short_description", null: false
    t.string "linkedin_url", limit: 2083, null: false
    t.string "twitter_url", limit: 2083, null: false
    t.index ["profile_photo_id"], name: "training_staffmember_1c716876"
  end

  create_table "training_taggedcoursecategory", id: :serial, force: :cascade do |t|
    t.integer "content_object_id", null: false
    t.integer "tag_id", null: false
    t.index ["content_object_id"], name: "training_taggedcoursecategory_09a80f33"
    t.index ["tag_id"], name: "training_taggedcoursecategory_76f094bc"
  end

  create_table "training_taggedcoursecity", id: :serial, force: :cascade do |t|
    t.integer "content_object_id", null: false
    t.integer "tag_id", null: false
    t.index ["content_object_id"], name: "training_taggedcoursecity_09a80f33"
    t.index ["tag_id"], name: "training_taggedcoursecity_76f094bc"
  end

  create_table "training_taggedcourseexpertisearea", id: :serial, force: :cascade do |t|
    t.integer "content_object_id", null: false
    t.integer "tag_id", null: false
    t.index ["content_object_id"], name: "training_taggedcourseexpertisearea_09a80f33"
    t.index ["tag_id"], name: "training_taggedcourseexpertisearea_76f094bc"
  end

  create_table "training_termsandconditionspage", primary_key: "page_ptr_id", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voucher_voucher", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 128, null: false
    t.string "usage", limit: 128, null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.integer "num_basket_additions", null: false
    t.integer "num_orders", null: false
    t.decimal "total_discount", precision: 12, scale: 2, null: false
    t.date "date_created", null: false
    t.index ["code"], name: "voucher_voucher_code_6fb678c0f6708cbe_like", opclass: :varchar_pattern_ops
    t.index ["code"], name: "voucher_voucher_code_key", unique: true
  end

  create_table "voucher_voucher_offers", id: :serial, force: :cascade do |t|
    t.integer "voucher_id", null: false
    t.integer "conditionaloffer_id", null: false
    t.index ["conditionaloffer_id"], name: "voucher_voucher_offers_a8841877"
    t.index ["voucher_id", "conditionaloffer_id"], name: "voucher_voucher_offers_voucher_id_conditionaloffer_id_key", unique: true
    t.index ["voucher_id"], name: "voucher_voucher_offers_3e8639ee"
  end

  create_table "voucher_voucherapplication", id: :serial, force: :cascade do |t|
    t.date "date_created", null: false
    t.integer "order_id", null: false
    t.integer "user_id"
    t.integer "voucher_id", null: false
    t.index ["order_id"], name: "voucher_voucherapplication_69dfcb07"
    t.index ["user_id"], name: "voucher_voucherapplication_e8701ad4"
    t.index ["voucher_id"], name: "voucher_voucherapplication_3e8639ee"
  end

  create_table "wagtailcore_collection", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false, collation: "C"
    t.integer "depth", null: false
    t.integer "numchild", null: false
    t.string "name", limit: 255, null: false
    t.index ["path"], name: "wagtailcore_collection_path_33d331bbd17c7f7e_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "wagtailcore_collection_path_key", unique: true
  end

  create_table "wagtailcore_groupcollectionpermission", id: :serial, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["collection_id"], name: "wagtailcore_groupcollectionpermission_0a1a4dd8"
    t.index ["group_id", "collection_id", "permission_id"], name: "wagtailcore_groupcollectionpermi_group_id_55bfae56e6463aff_uniq", unique: true
    t.index ["group_id"], name: "wagtailcore_groupcollectionpermission_0e939a4f"
    t.index ["permission_id"], name: "wagtailcore_groupcollectionpermission_8373b171"
  end

  create_table "wagtailcore_grouppagepermission", id: :serial, force: :cascade do |t|
    t.string "permission_type", limit: 20, null: false
    t.integer "group_id", null: false
    t.integer "page_id", null: false
    t.index ["group_id", "page_id", "permission_type"], name: "wagtailcore_grouppagepermission_group_id_7b4725f4d97cf081_uniq", unique: true
    t.index ["group_id"], name: "wagtailcore_grouppagepermission_0e939a4f"
    t.index ["page_id"], name: "wagtailcore_grouppagepermission_1a63c800"
  end

  create_table "wagtailcore_page", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.integer "depth", null: false
    t.integer "numchild", null: false
    t.string "title", limit: 255, null: false
    t.string "slug", limit: 255, null: false
    t.boolean "live", null: false
    t.boolean "has_unpublished_changes", null: false
    t.text "url_path", null: false
    t.string "seo_title", limit: 255, null: false
    t.boolean "show_in_menus", null: false
    t.text "search_description", null: false
    t.datetime "go_live_at"
    t.datetime "expire_at"
    t.boolean "expired", null: false
    t.integer "content_type_id", null: false
    t.integer "owner_id"
    t.boolean "locked", null: false
    t.datetime "latest_revision_created_at"
    t.datetime "first_published_at"
    t.index ["content_type_id"], name: "wagtailcore_page_417f1b1c"
    t.index ["first_published_at"], name: "wagtailcore_page_first_published_at_2d14e79e1ef5c158_uniq"
    t.index ["owner_id"], name: "wagtailcore_page_5e7b1936"
    t.index ["path"], name: "wagtailcore_page_path_3ba164ba287054c2_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "wagtailcore_page_path_key", unique: true
    t.index ["slug"], name: "wagtailcore_page_2dbcba41"
    t.index ["slug"], name: "wagtailcore_page_slug_77daff4c17eb2942_like", opclass: :varchar_pattern_ops
  end

  create_table "wagtailcore_pagerevision", id: :serial, force: :cascade do |t|
    t.boolean "submitted_for_moderation", null: false
    t.datetime "created_at", null: false
    t.text "content_json", null: false
    t.datetime "approved_go_live_at"
    t.integer "page_id", null: false
    t.integer "user_id"
    t.index ["page_id"], name: "wagtailcore_pagerevision_1a63c800"
    t.index ["submitted_for_moderation"], name: "wagtailcore_page_submitted_for_moderation_2ef07c641e5fc4c4_uniq"
    t.index ["user_id"], name: "wagtailcore_pagerevision_e8701ad4"
  end

  create_table "wagtailcore_pageviewrestriction", id: :serial, force: :cascade do |t|
    t.string "password", limit: 255, null: false
    t.integer "page_id", null: false
    t.index ["page_id"], name: "wagtailcore_pageviewrestriction_1a63c800"
  end

  create_table "wagtailcore_site", id: :serial, force: :cascade do |t|
    t.string "hostname", limit: 255, null: false
    t.integer "port", null: false
    t.boolean "is_default_site", null: false
    t.integer "root_page_id", null: false
    t.string "site_name", limit: 255
    t.index ["hostname", "port"], name: "wagtailcore_site_hostname_436606941bba05b7_uniq", unique: true
    t.index ["hostname"], name: "wagtailcore_site_0897acf4"
    t.index ["hostname"], name: "wagtailcore_site_hostname_418efd4cef0768ab_like", opclass: :varchar_pattern_ops
    t.index ["root_page_id"], name: "wagtailcore_site_8372b497"
  end

  create_table "wagtaildocs_document", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "file", limit: 100, null: false
    t.datetime "created_at", null: false
    t.integer "uploaded_by_user_id"
    t.integer "collection_id", null: false
    t.index ["collection_id"], name: "wagtaildocs_document_0a1a4dd8"
    t.index ["uploaded_by_user_id"], name: "wagtaildocs_document_ef01e2b6"
  end

  create_table "wagtailembeds_embed", id: :serial, force: :cascade do |t|
    t.string "url", limit: 200, null: false
    t.integer "max_width", limit: 2
    t.string "type", limit: 10, null: false
    t.text "html", null: false
    t.text "title", null: false
    t.text "author_name", null: false
    t.text "provider_name", null: false
    t.string "thumbnail_url", limit: 200
    t.integer "width"
    t.integer "height"
    t.datetime "last_updated", null: false
    t.index ["url", "max_width"], name: "wagtailembeds_embed_url_4fd35b6f26559fd_uniq", unique: true
  end

  create_table "wagtailforms_formsubmission", id: :serial, force: :cascade do |t|
    t.text "form_data", null: false
    t.datetime "submit_time", null: false
    t.integer "page_id", null: false
    t.index ["page_id"], name: "wagtailforms_formsubmission_1a63c800"
  end

  create_table "wagtailimages_filter", id: :serial, force: :cascade do |t|
    t.string "spec", limit: 255, null: false
    t.index ["spec"], name: "wagtailimages_filter_b979c293"
    t.index ["spec"], name: "wagtailimages_filter_spec_7e7f7c5e0d07374c_like", opclass: :varchar_pattern_ops
    t.index ["spec"], name: "wagtailimages_filter_spec_7e7f7c5e0d07374c_uniq", unique: true
  end

  create_table "wagtailimages_image", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "file", limit: 100, null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.datetime "created_at", null: false
    t.integer "focal_point_x"
    t.integer "focal_point_y"
    t.integer "focal_point_width"
    t.integer "focal_point_height"
    t.integer "uploaded_by_user_id"
    t.integer "file_size"
    t.integer "collection_id", null: false
    t.index ["collection_id"], name: "wagtailimages_image_0a1a4dd8"
    t.index ["created_at"], name: "wagtailimages_image_created_at_3364c0ce8f6357d5_uniq"
    t.index ["uploaded_by_user_id"], name: "wagtailimages_image_ef01e2b6"
  end

  create_table "wagtailimages_rendition", id: :serial, force: :cascade do |t|
    t.string "file", limit: 100, null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.string "focal_point_key", limit: 255, null: false
    t.integer "filter_id", null: false
    t.integer "image_id", null: false
    t.index ["filter_id"], name: "wagtailimages_rendition_0a317463"
    t.index ["image_id", "filter_id", "focal_point_key"], name: "wagtailimages_rendition_image_id_780db125f9645d7d_uniq", unique: true
    t.index ["image_id"], name: "wagtailimages_rendition_f33175e6"
  end

  create_table "wagtailredirects_redirect", id: :serial, force: :cascade do |t|
    t.string "old_path", limit: 255, null: false
    t.boolean "is_permanent", null: false
    t.string "redirect_link", limit: 200, null: false
    t.integer "redirect_page_id"
    t.integer "site_id"
    t.index ["old_path", "site_id"], name: "wagtailredirects_redirect_old_path_3a7e3e7872fcdac8_uniq", unique: true
    t.index ["old_path"], name: "wagtailredirects_redirect_old_path_3c38cd6fe8863d52_like", opclass: :varchar_pattern_ops
    t.index ["redirect_page_id"], name: "wagtailredirects_redirect_2fd79f37"
    t.index ["site_id"], name: "wagtailredirects_redirect_9365d6e7"
  end

  create_table "wagtailsearch_editorspick", id: :serial, force: :cascade do |t|
    t.integer "sort_order"
    t.text "description", null: false
    t.integer "page_id", null: false
    t.integer "query_id", null: false
    t.index ["page_id"], name: "wagtailsearch_editorspick_1a63c800"
    t.index ["query_id"], name: "wagtailsearch_editorspick_0bbeda9c"
  end

  create_table "wagtailsearch_query", id: :serial, force: :cascade do |t|
    t.string "query_string", limit: 255, null: false
    t.index ["query_string"], name: "wagtailsearch_query_query_string_50da7e497b2a83df_like", opclass: :varchar_pattern_ops
    t.index ["query_string"], name: "wagtailsearch_query_query_string_key", unique: true
  end

  create_table "wagtailsearch_querydailyhits", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.integer "hits", null: false
    t.integer "query_id", null: false
    t.index ["query_id", "date"], name: "wagtailsearch_querydailyhits_query_id_99ff8f8bcda7420_uniq", unique: true
    t.index ["query_id"], name: "wagtailsearch_querydailyhits_0bbeda9c"
  end

  create_table "wagtailusers_userprofile", id: :serial, force: :cascade do |t|
    t.boolean "submitted_notifications", null: false
    t.boolean "approved_notifications", null: false
    t.boolean "rejected_notifications", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "wagtailusers_userprofile_user_id_key", unique: true
  end

  create_table "wishlists_line", id: :serial, force: :cascade do |t|
    t.integer "quantity", null: false
    t.string "title", limit: 255, null: false
    t.integer "product_id"
    t.integer "wishlist_id", null: false
    t.index ["product_id"], name: "wishlists_line_9bea82de"
    t.index ["wishlist_id", "product_id"], name: "wishlists_line_wishlist_id_788bef7472caa6e7_uniq", unique: true
    t.index ["wishlist_id"], name: "wishlists_line_e2f8e270"
  end

  create_table "wishlists_wishlist", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "key", limit: 6, null: false
    t.string "visibility", limit: 20, null: false
    t.datetime "date_created", null: false
    t.integer "owner_id", null: false
    t.index ["key"], name: "wishlists_wishlist_key_60832e098cdf3524_like", opclass: :varchar_pattern_ops
    t.index ["key"], name: "wishlists_wishlist_key_key", unique: true
    t.index ["owner_id"], name: "wishlists_wishlist_5e7b1936"
  end

  add_foreign_key "address_useraddress", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "ad_country_id_77f619edf3bc65b0_fk_address_country_iso_3166_1_a2"
  add_foreign_key "address_useraddress", "auth_user", column: "user_id", name: "address_useraddress_user_id_4480e7fc17c7f57f_fk_auth_user_id"
  add_foreign_key "analytics_productrecord", "catalogue_product", column: "product_id", name: "analytics_p_product_id_4336e38c8d5f07d6_fk_catalogue_product_id"
  add_foreign_key "analytics_userproductview", "auth_user", column: "user_id", name: "analytics_userproductvi_user_id_df6c245b24add7d_fk_auth_user_id"
  add_foreign_key "analytics_userproductview", "catalogue_product", column: "product_id", name: "analytics_us_product_id_72f11b81dc558d9_fk_catalogue_product_id"
  add_foreign_key "analytics_userrecord", "auth_user", column: "user_id", name: "analytics_userrecord_user_id_42c70631bde0329f_fk_auth_user_id"
  add_foreign_key "analytics_usersearch", "auth_user", column: "user_id", name: "analytics_usersearch_user_id_27b628e4cc9bd26a_fk_auth_user_id"
  add_foreign_key "angels_aboutpage", "wagtailcore_page", column: "page_ptr_id", name: "angels_abou_page_ptr_id_18d92d3d626f8cad_fk_wagtailcore_page_id"
  add_foreign_key "angels_careservice", "wagtailcore_page", column: "page_ptr_id", name: "angels_care_page_ptr_id_6c0ea18a5239eb95_fk_wagtailcore_page_id"
  add_foreign_key "angels_careservice", "wagtailimages_image", column: "icon_id", name: "angels_cares_icon_id_76f2e75fa7e70142_fk_wagtailimages_image_id"
  add_foreign_key "angels_careservicedocument", "wagtaildocs_document", column: "document_id", name: "angels__document_id_74487bd5219a70d2_fk_wagtaildocs_document_id"
  add_foreign_key "angels_contactspage", "wagtailcore_page", column: "page_ptr_id", name: "angels_cont_page_ptr_id_618e4b7fdbdc4add_fk_wagtailcore_page_id"
  add_foreign_key "angels_faqspage", "wagtailcore_page", column: "page_ptr_id", name: "angels_faqs_page_ptr_id_53e7586002afed79_fk_wagtailcore_page_id"
  add_foreign_key "angels_homepage", "wagtailcore_page", column: "page_ptr_id", name: "angels_home_page_ptr_id_7fc0daa4282a7150_fk_wagtailcore_page_id"
  add_foreign_key "angels_homepagefeaturedcareservice", "angels_careservice", column: "care_service_id", primary_key: "page_ptr_id", name: "ae3a21427750efe63da27448b72e832e"
  add_foreign_key "angels_homepagefeaturedcareservice", "angels_homepage", column: "page_id", primary_key: "page_ptr_id", name: "angels__page_id_3a7dd2987c6af465_fk_angels_homepage_page_ptr_id"
  add_foreign_key "angels_patientcarepage", "wagtailcore_page", column: "page_ptr_id", name: "angels_pati_page_ptr_id_5ac85a0efbc9001f_fk_wagtailcore_page_id"
  add_foreign_key "angels_privacypolicypage", "wagtailcore_page", column: "page_ptr_id", name: "angels_priv_page_ptr_id_4226fdd5366d5b98_fk_wagtailcore_page_id"
  add_foreign_key "angels_staffindex", "wagtailcore_page", column: "page_ptr_id", name: "angels_staf_page_ptr_id_4d6b6fe8e1666e01_fk_wagtailcore_page_id"
  add_foreign_key "angels_staffmember", "wagtailcore_page", column: "page_ptr_id", name: "angels_staf_page_ptr_id_2e42aa0375458bbf_fk_wagtailcore_page_id"
  add_foreign_key "angels_staffmember", "wagtailimages_image", column: "profile_photo_id", name: "ang_profile_photo_id_6750ae78c41993dc_fk_wagtailimages_image_id"
  add_foreign_key "angels_termsandconditionspage", "wagtailcore_page", column: "page_ptr_id", name: "angels_term_page_ptr_id_5b7d1dcc57515d15_fk_wagtailcore_page_id"
  add_foreign_key "annotations", "categories"
  add_foreign_key "annotations", "manifesto_items"
  add_foreign_key "annotations", "users"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permission_group_id_da05cd25ba2b35d_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permission_id_5b359d04ffc568fd_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_content_type_id_1bd4cf967d6b8815_fk_django_content_type_id"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_6633d96f46f66b4f_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_20f8e8ef4b3a4831_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user__permission_id_2e8b032a10ad49b0_fk_auth_permission_id"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permiss_user_id_447c044904f04b22_fk_auth_user_id"
  add_foreign_key "basket_basket", "auth_user", column: "owner_id", name: "basket_basket_owner_id_7bed24a9b25c08f6_fk_auth_user_id"
  add_foreign_key "basket_basket_vouchers", "basket_basket", column: "basket_id", name: "basket_basket_vo_basket_id_1567a35b723f171d_fk_basket_basket_id"
  add_foreign_key "basket_basket_vouchers", "voucher_voucher", column: "voucher_id", name: "basket_basket__voucher_id_4e0ec2e115b37db_fk_voucher_voucher_id"
  add_foreign_key "basket_line", "basket_basket", column: "basket_id", name: "basket_line_basket_id_4129b75f925304ad_fk_basket_basket_id"
  add_foreign_key "basket_line", "catalogue_product", column: "product_id", name: "basket_line_product_id_3e8b7f5f0645854f_fk_catalogue_product_id"
  add_foreign_key "basket_line", "partner_stockrecord", column: "stockrecord_id", name: "baske_stockrecord_id_3afaaf531edb2a94_fk_partner_stockrecord_id"
  add_foreign_key "basket_lineattribute", "basket_line", column: "line_id", name: "basket_lineattribute_line_id_30e776a81c863351_fk_basket_line_id"
  add_foreign_key "basket_lineattribute", "catalogue_option", column: "option_id", name: "basket_lineat_option_id_6220109da33eb8f5_fk_catalogue_option_id"
  add_foreign_key "careers_jobapplication", "wagtailcore_page", column: "page_id", name: "careers_jobappl_page_id_3b8f6dc2677e8d9d_fk_wagtailcore_page_id"
  add_foreign_key "catalogue_attributeoption", "catalogue_attributeoptiongroup", column: "group_id", name: "group_id_1a2df8d6a3c89084_fk_catalogue_attributeoptiongroup_id"
  add_foreign_key "catalogue_product", "catalogue_product", column: "parent_id", name: "catalogue_pr_parent_id_1a170facde09b3fe_fk_catalogue_product_id"
  add_foreign_key "catalogue_product", "catalogue_productclass", column: "product_class_id", name: "product_class_id_330609480b93ae4f_fk_catalogue_productclass_id"
  add_foreign_key "catalogue_product", "cpl_cplproduct", column: "cpl_course_id", name: "catalogue_p_cpl_course_id_5e9a3575b3912762_fk_cpl_cplproduct_id"
  add_foreign_key "catalogue_product_product_options", "catalogue_option", column: "option_id", name: "catalogue_pro_option_id_4ba7655c895c9b36_fk_catalogue_option_id"
  add_foreign_key "catalogue_product_product_options", "catalogue_product", column: "product_id", name: "catalogue_pr_product_id_51b82b03a1bf90a_fk_catalogue_product_id"
  add_foreign_key "catalogue_productattribute", "catalogue_attributeoptiongroup", column: "option_group_id", name: "a727339c5f71ea19936ff535cd7653e0"
  add_foreign_key "catalogue_productattribute", "catalogue_productclass", column: "product_class_id", name: "product_class_id_4535d461fe3c783e_fk_catalogue_productclass_id"
  add_foreign_key "catalogue_productattributevalue", "catalogue_attributeoption", column: "value_option_id", name: "value_option_id_566415a7be5605_fk_catalogue_attributeoption_id"
  add_foreign_key "catalogue_productattributevalue", "catalogue_product", column: "product_id", name: "catalogue_p_product_id_17278215a3c5dfb6_fk_catalogue_product_id"
  add_foreign_key "catalogue_productattributevalue", "catalogue_productattribute", column: "attribute_id", name: "attribute_id_1d13f198bb4dcb5d_fk_catalogue_productattribute_id"
  add_foreign_key "catalogue_productattributevalue", "django_content_type", column: "entity_content_type_id", name: "b41c46eacf03f94876a1991c8650494f"
  add_foreign_key "catalogue_productcategory", "catalogue_category", column: "category_id", name: "catalogue_category_id_6d6a480ff63074ee_fk_catalogue_category_id"
  add_foreign_key "catalogue_productcategory", "catalogue_product", column: "product_id", name: "catalogue_p_product_id_25a92bd305d28dd1_fk_catalogue_product_id"
  add_foreign_key "catalogue_productclass_options", "catalogue_option", column: "option_id", name: "catalogue_pro_option_id_76d0e99711c5e9a3_fk_catalogue_option_id"
  add_foreign_key "catalogue_productclass_options", "catalogue_productclass", column: "productclass_id", name: "c_productclass_id_1c8260e6cec1e3f5_fk_catalogue_productclass_id"
  add_foreign_key "catalogue_productimage", "catalogue_product", column: "product_id", name: "catalogue_p_product_id_4f468e4c5649edcb_fk_catalogue_product_id"
  add_foreign_key "catalogue_productrecommendation", "catalogue_product", column: "primary_id", name: "catalogue_p_primary_id_39f4c313c38c4f61_fk_catalogue_product_id"
  add_foreign_key "catalogue_productrecommendation", "catalogue_product", column: "recommendation_id", name: "cata_recommendation_id_5207129c5f304217_fk_catalogue_product_id"
  add_foreign_key "comments", "manifesto_items"
  add_foreign_key "comments", "users"
  add_foreign_key "cpl_cpluser", "auth_user", column: "user_id", name: "cpl_cpluser_user_id_bfe290e38e379b_fk_auth_user_id"
  add_foreign_key "customer_email", "auth_user", column: "user_id", name: "customer_email_user_id_593ac8884dc0413_fk_auth_user_id"
  add_foreign_key "customer_notification", "auth_user", column: "recipient_id", name: "customer_notifica_recipient_id_634d8a89ee61fd5a_fk_auth_user_id"
  add_foreign_key "customer_notification", "auth_user", column: "sender_id", name: "customer_notificatio_sender_id_689ff66090025b0c_fk_auth_user_id"
  add_foreign_key "customer_productalert", "auth_user", column: "user_id", name: "customer_productalert_user_id_18343abf740e8ff3_fk_auth_user_id"
  add_foreign_key "customer_productalert", "catalogue_product", column: "product_id", name: "customer_pr_product_id_4da41a1e9721d051_fk_catalogue_product_id"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_1293316690c288f_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "djan_content_type_id_3962fec3485f3133_fk_django_content_type_id"
  add_foreign_key "django_flatpage_sites", "django_flatpage", column: "flatpage_id", name: "django_flatp_flatpage_id_4901c672d4387e31_fk_django_flatpage_id"
  add_foreign_key "django_flatpage_sites", "django_site", column: "site_id", name: "django_flatpage_site_site_id_33355145807e071d_fk_django_site_id"
  add_foreign_key "group_aboutpage", "wagtailcore_page", column: "page_ptr_id", name: "group_about_page_ptr_id_38e4f08ef0a495d0_fk_wagtailcore_page_id"
  add_foreign_key "group_careerpage", "wagtailcore_page", column: "page_ptr_id", name: "group_caree_page_ptr_id_634d8bb029aa1b81_fk_wagtailcore_page_id"
  add_foreign_key "group_careerpage", "wagtailimages_image", column: "detail_image_id", name: "grou_detail_image_id_14d73b6c3ee9d180_fk_wagtailimages_image_id"
  add_foreign_key "group_careerpage", "wagtailimages_image", column: "index_image_id", name: "group_index_image_id_50d4cbb38aafbdf0_fk_wagtailimages_image_id"
  add_foreign_key "group_careersindex", "wagtailcore_page", column: "page_ptr_id", name: "group_caree_page_ptr_id_2e7c44397467b2c9_fk_wagtailcore_page_id"
  add_foreign_key "group_carepage", "wagtailcore_page", column: "page_ptr_id", name: "group_carep_page_ptr_id_7b07f42deab23fbb_fk_wagtailcore_page_id"
  add_foreign_key "group_contactspage", "wagtailcore_page", column: "page_ptr_id", name: "group_conta_page_ptr_id_4c92d39ced248808_fk_wagtailcore_page_id"
  add_foreign_key "group_faqspage", "wagtailcore_page", column: "page_ptr_id", name: "group_faqsp_page_ptr_id_1b88b8baf1accde2_fk_wagtailcore_page_id"
  add_foreign_key "group_homepage", "wagtailcore_page", column: "page_ptr_id", name: "group_homep_page_ptr_id_35ad0f95ac6ea7c0_fk_wagtailcore_page_id"
  add_foreign_key "group_newsarticle", "wagtailcore_page", column: "page_ptr_id", name: "group_newsa_page_ptr_id_27b2a51152c6b8d9_fk_wagtailcore_page_id"
  add_foreign_key "group_newsarticle", "wagtailimages_image", column: "detail_image_id", name: "grou_detail_image_id_6e7a08e69853d12c_fk_wagtailimages_image_id"
  add_foreign_key "group_newsarticle", "wagtailimages_image", column: "index_image_id", name: "group_index_image_id_5a91583dee3e1f91_fk_wagtailimages_image_id"
  add_foreign_key "group_newsindex", "wagtailcore_page", column: "page_ptr_id", name: "group_newsi_page_ptr_id_6b60bef03d38c0e0_fk_wagtailcore_page_id"
  add_foreign_key "group_privacypolicypage", "wagtailcore_page", column: "page_ptr_id", name: "group_priva_page_ptr_id_4dcb1848b04c59a6_fk_wagtailcore_page_id"
  add_foreign_key "group_termsandconditionspage", "wagtailcore_page", column: "page_ptr_id", name: "group_terms_page_ptr_id_1b2a336825d37c1e_fk_wagtailcore_page_id"
  add_foreign_key "group_trainingpage", "wagtailcore_page", column: "page_ptr_id", name: "group_train_page_ptr_id_22308f71a47b23b7_fk_wagtailcore_page_id"
  add_foreign_key "hospital_aboutpage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_ab_page_ptr_id_6bc93601ff1f35d3_fk_wagtailcore_page_id"
  add_foreign_key "hospital_careerpage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_ca_page_ptr_id_5e61d97c1c8ae8b6_fk_wagtailcore_page_id"
  add_foreign_key "hospital_careerpage", "wagtailimages_image", column: "detail_image_id", name: "hosp_detail_image_id_47468bf72c959391_fk_wagtailimages_image_id"
  add_foreign_key "hospital_careerpage", "wagtailimages_image", column: "index_image_id", name: "hospi_index_image_id_2ad48990612e3c99_fk_wagtailimages_image_id"
  add_foreign_key "hospital_careersindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_car_page_ptr_id_e86efed84a7130e_fk_wagtailcore_page_id"
  add_foreign_key "hospital_condition", "wagtailcore_page", column: "page_ptr_id", name: "hospital_co_page_ptr_id_2b5681c0518fb654_fk_wagtailcore_page_id"
  add_foreign_key "hospital_condition", "wagtailimages_image", column: "icon_id", name: "hospital_con_icon_id_7ed9ba2fc0992fc5_fk_wagtailimages_image_id"
  add_foreign_key "hospital_condition", "wagtailimages_image", column: "inverted_icon_id", name: "hos_inverted_icon_id_2ba4daf8566ebcb9_fk_wagtailimages_image_id"
  add_foreign_key "hospital_conditiondocument", "hospital_condition", column: "page_id", primary_key: "page_ptr_id", name: "hosp_page_id_1a8adcc106f8b028_fk_hospital_condition_page_ptr_id"
  add_foreign_key "hospital_conditiondocument", "wagtaildocs_document", column: "document_id", name: "hospita_document_id_3dafcb6b3e3d474a_fk_wagtaildocs_document_id"
  add_foreign_key "hospital_conditionindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_co_page_ptr_id_2f03083995a6f5f6_fk_wagtailcore_page_id"
  add_foreign_key "hospital_contactspage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_co_page_ptr_id_1540babfe6fcdb59_fk_wagtailcore_page_id"
  add_foreign_key "hospital_equipment", "wagtailcore_page", column: "page_ptr_id", name: "hospital_eq_page_ptr_id_21e9cc80e00fa57c_fk_wagtailcore_page_id"
  add_foreign_key "hospital_equipment", "wagtailimages_image", column: "detail_image_id", name: "hosp_detail_image_id_6cd12e220c74e797_fk_wagtailimages_image_id"
  add_foreign_key "hospital_equipment", "wagtailimages_image", column: "index_image_id", name: "hospit_index_image_id_268a34fcc24ca22_fk_wagtailimages_image_id"
  add_foreign_key "hospital_equipmentindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_eq_page_ptr_id_15ba7e79f951f1eb_fk_wagtailcore_page_id"
  add_foreign_key "hospital_equipmenttag", "hospital_equipment", column: "content_object_id", primary_key: "page_ptr_id", name: "ac02de7193b1cc2388b479a439d04841"
  add_foreign_key "hospital_equipmenttag", "taggit_tag", column: "tag_id", name: "hospital_equipmenttag_tag_id_740a7f091f9601ff_fk_taggit_tag_id"
  add_foreign_key "hospital_facilityindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_fa_page_ptr_id_618f15da341eed28_fk_wagtailcore_page_id"
  add_foreign_key "hospital_faqspage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_fa_page_ptr_id_552f13b85732a597_fk_wagtailcore_page_id"
  add_foreign_key "hospital_homepage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_ho_page_ptr_id_7f070b09563381a5_fk_wagtailcore_page_id"
  add_foreign_key "hospital_homepagefeaturedcareservice", "hospital_homepage", column: "page_id", primary_key: "page_ptr_id", name: "hospi_page_id_27b82b1db3e507d7_fk_hospital_homepage_page_ptr_id"
  add_foreign_key "hospital_homepagefeaturedcareservice", "wagtailcore_page", column: "care_service_id", name: "hospita_care_service_id_72ee98a61f613d44_fk_wagtailcore_page_id"
  add_foreign_key "hospital_privacypolicypage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_pr_page_ptr_id_4121fc8318f4745e_fk_wagtailcore_page_id"
  add_foreign_key "hospital_staffindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_st_page_ptr_id_4b02adc5fc03349f_fk_wagtailcore_page_id"
  add_foreign_key "hospital_staffmember", "wagtailcore_page", column: "page_ptr_id", name: "hospital_st_page_ptr_id_424b0d34962e3d87_fk_wagtailcore_page_id"
  add_foreign_key "hospital_staffmember", "wagtailimages_image", column: "profile_photo_id", name: "hos_profile_photo_id_739c8b4922f66059_fk_wagtailimages_image_id"
  add_foreign_key "hospital_termsandconditionspage", "wagtailcore_page", column: "page_ptr_id", name: "hospital_te_page_ptr_id_192393a1bed35a4d_fk_wagtailcore_page_id"
  add_foreign_key "hospital_treatment", "wagtailcore_page", column: "page_ptr_id", name: "hospital_tr_page_ptr_id_519081a3963ee133_fk_wagtailcore_page_id"
  add_foreign_key "hospital_treatment", "wagtailimages_image", column: "icon_id", name: "hospital_tre_icon_id_52b2b03c53f493d6_fk_wagtailimages_image_id"
  add_foreign_key "hospital_treatment", "wagtailimages_image", column: "inverted_icon_id", name: "hos_inverted_icon_id_11988468a09258a8_fk_wagtailimages_image_id"
  add_foreign_key "hospital_treatmentdocument", "hospital_treatment", column: "page_id", primary_key: "page_ptr_id", name: "hosp_page_id_305144eed71c06d1_fk_hospital_treatment_page_ptr_id"
  add_foreign_key "hospital_treatmentdocument", "wagtaildocs_document", column: "document_id", name: "hospita_document_id_1ba16ca69266c12b_fk_wagtaildocs_document_id"
  add_foreign_key "hospital_treatmentindex", "wagtailcore_page", column: "page_ptr_id", name: "hospital_tr_page_ptr_id_5d542b62052d06f2_fk_wagtailcore_page_id"
  add_foreign_key "lodge_aboutpage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_about_page_ptr_id_7af29b816ee432bd_fk_wagtailcore_page_id"
  add_foreign_key "lodge_admissionpolicypage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_admis_page_ptr_id_686334a38b9ac7ee_fk_wagtailcore_page_id"
  add_foreign_key "lodge_condition", "wagtailcore_page", column: "page_ptr_id", name: "lodge_condi_page_ptr_id_4f47025819f1a14e_fk_wagtailcore_page_id"
  add_foreign_key "lodge_condition", "wagtailimages_image", column: "icon_id", name: "lodge_condit_icon_id_60868e3bc924bb35_fk_wagtailimages_image_id"
  add_foreign_key "lodge_condition", "wagtailimages_image", column: "inverted_icon_id", name: "lod_inverted_icon_id_2cab6125461aa4c1_fk_wagtailimages_image_id"
  add_foreign_key "lodge_conditiondocument", "lodge_condition", column: "page_id", primary_key: "page_ptr_id", name: "lodge_c_page_id_334c537099bd61c0_fk_lodge_condition_page_ptr_id"
  add_foreign_key "lodge_conditiondocument", "wagtaildocs_document", column: "document_id", name: "lodge_c_document_id_69a9c1d0c331294e_fk_wagtaildocs_document_id"
  add_foreign_key "lodge_contactspage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_conta_page_ptr_id_338416fd7f3d6c8a_fk_wagtailcore_page_id"
  add_foreign_key "lodge_facilitiespage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_facil_page_ptr_id_69a9b939dd1971fc_fk_wagtailcore_page_id"
  add_foreign_key "lodge_faqspage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_faqsp_page_ptr_id_1f876afebe9807d7_fk_wagtailcore_page_id"
  add_foreign_key "lodge_homepage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_homepa_page_ptr_id_91df5a11b3523e7_fk_wagtailcore_page_id"
  add_foreign_key "lodge_homepagefeaturedcondition", "lodge_condition", column: "condition_id", primary_key: "page_ptr_id", name: "lo_condition_id_14955257694329be_fk_lodge_condition_page_ptr_id"
  add_foreign_key "lodge_homepagefeaturedcondition", "lodge_homepage", column: "page_id", primary_key: "page_ptr_id", name: "lodge_hom_page_id_71a306d33427130_fk_lodge_homepage_page_ptr_id"
  add_foreign_key "lodge_lifestylepage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_lifes_page_ptr_id_65a858504363dc38_fk_wagtailcore_page_id"
  add_foreign_key "lodge_patientcarepage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_patien_page_ptr_id_fc9a775152d884d_fk_wagtailcore_page_id"
  add_foreign_key "lodge_privacypolicypage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_priva_page_ptr_id_3535d2bd46279941_fk_wagtailcore_page_id"
  add_foreign_key "lodge_staffindex", "wagtailcore_page", column: "page_ptr_id", name: "lodge_staff_page_ptr_id_6c45f9d41dcf4359_fk_wagtailcore_page_id"
  add_foreign_key "lodge_staffmember", "wagtailcore_page", column: "page_ptr_id", name: "lodge_staff_page_ptr_id_4610ee9534aac53d_fk_wagtailcore_page_id"
  add_foreign_key "lodge_staffmember", "wagtailimages_image", column: "profile_photo_id", name: "lod_profile_photo_id_4c9a542a2f35c4a2_fk_wagtailimages_image_id"
  add_foreign_key "lodge_termsandconditionspage", "wagtailcore_page", column: "page_ptr_id", name: "lodge_terms_page_ptr_id_67e31c2558bc9ca6_fk_wagtailcore_page_id"
  add_foreign_key "manifesto_items", "annotations"
  add_foreign_key "manifesto_items", "manifesto_items"
  add_foreign_key "manifesto_items", "manifesto_sections"
  add_foreign_key "manifesto_sections", "manifesto_sections"
  add_foreign_key "manifesto_sections", "manifestos"
  add_foreign_key "manifestos", "parties"
  add_foreign_key "offer_benefit", "offer_range", column: "range_id", name: "offer_benefit_range_id_5cb2fc7bdb2dff3_fk_offer_range_id"
  add_foreign_key "offer_condition", "offer_range", column: "range_id", name: "offer_condition_range_id_3da77a758ccecdaf_fk_offer_range_id"
  add_foreign_key "offer_conditionaloffer", "offer_benefit", column: "benefit_id", name: "offer_condition_benefit_id_695291077532c2f5_fk_offer_benefit_id"
  add_foreign_key "offer_conditionaloffer", "offer_condition", column: "condition_id", name: "offer_condi_condition_id_7b81c5246123ee40_fk_offer_condition_id"
  add_foreign_key "offer_range_classes", "catalogue_productclass", column: "productclass_id", name: "o_productclass_id_375d6cda579615fb_fk_catalogue_productclass_id"
  add_foreign_key "offer_range_classes", "offer_range", column: "range_id", name: "offer_range_classes_range_id_7d1af0209a8fe6a7_fk_offer_range_id"
  add_foreign_key "offer_range_excluded_products", "catalogue_product", column: "product_id", name: "offer_range__product_id_4e0a1c69c2743c2_fk_catalogue_product_id"
  add_foreign_key "offer_range_excluded_products", "offer_range", column: "range_id", name: "offer_range_exclude_range_id_67ec169e895c6a7e_fk_offer_range_id"
  add_foreign_key "offer_range_included_categories", "catalogue_category", column: "category_id", name: "offer_ran_category_id_4871cb17c938bb58_fk_catalogue_category_id"
  add_foreign_key "offer_range_included_categories", "offer_range", column: "range_id", name: "offer_range_include_range_id_59327ba410bcce6d_fk_offer_range_id"
  add_foreign_key "offer_rangeproduct", "catalogue_product", column: "product_id", name: "offer_rangep_product_id_2fdc4e8b864973e_fk_catalogue_product_id"
  add_foreign_key "offer_rangeproduct", "offer_range", column: "range_id", name: "offer_rangeproduct_range_id_53c29085f7fb4f7e_fk_offer_range_id"
  add_foreign_key "offer_rangeproductfileupload", "auth_user", column: "uploaded_by_id", name: "offer_rangeprodu_uploaded_by_id_d43cea43e2ba965_fk_auth_user_id"
  add_foreign_key "offer_rangeproductfileupload", "offer_range", column: "range_id", name: "offer_rangeproductf_range_id_5f8125f2c816d202_fk_offer_range_id"
  add_foreign_key "order_billingaddress", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "or_country_id_56c3b87c475ee23b_fk_address_country_iso_3166_1_a2"
  add_foreign_key "order_communicationevent", "customer_communicationeventtype", column: "event_type_id", name: "ca021e9c62093bcf884e77b15e5232c3"
  add_foreign_key "order_communicationevent", "order_order", column: "order_id", name: "order_communication_order_id_62815d0874463cfc_fk_order_order_id"
  add_foreign_key "order_line", "catalogue_product", column: "product_id", name: "order_line_product_id_3d9279c898ca8162_fk_catalogue_product_id"
  add_foreign_key "order_line", "order_order", column: "order_id", name: "order_line_order_id_5009d7eda795623f_fk_order_order_id"
  add_foreign_key "order_line", "partner_partner", column: "partner_id", name: "order_line_partner_id_47e6a14e5b4836db_fk_partner_partner_id"
  add_foreign_key "order_line", "partner_stockrecord", column: "stockrecord_id", name: "order_stockrecord_id_463c3ffd40f66293_fk_partner_stockrecord_id"
  add_foreign_key "order_lineattribute", "catalogue_option", column: "option_id", name: "order_lineattr_option_id_fb3c17da281c1c5_fk_catalogue_option_id"
  add_foreign_key "order_lineattribute", "order_line", column: "line_id", name: "order_lineattribute_line_id_3f6fe21a3805b897_fk_order_line_id"
  add_foreign_key "order_lineprice", "order_line", column: "line_id", name: "order_lineprice_line_id_23286e56fa9d291a_fk_order_line_id"
  add_foreign_key "order_lineprice", "order_order", column: "order_id", name: "order_lineprice_order_id_2aa6c8eacd4dc145_fk_order_order_id"
  add_foreign_key "order_order", "auth_user", column: "user_id", name: "order_order_user_id_791e96d74849446f_fk_auth_user_id"
  add_foreign_key "order_order", "basket_basket", column: "basket_id", name: "order_order_basket_id_6aba1e4838cd61d1_fk_basket_basket_id"
  add_foreign_key "order_order", "django_site", column: "site_id", name: "order_order_site_id_4ab8f14e4b80bcea_fk_django_site_id"
  add_foreign_key "order_order", "order_billingaddress", column: "billing_address_id", name: "billing_address_id_7b966fa7b311ef57_fk_order_billingaddress_id"
  add_foreign_key "order_order", "order_shippingaddress", column: "shipping_address_id", name: "D70b656a0a9718bd92e1e566093a5b17"
  add_foreign_key "order_orderdiscount", "order_order", column: "order_id", name: "order_orderdiscount_order_id_1895792d3a80d7a9_fk_order_order_id"
  add_foreign_key "order_ordernote", "auth_user", column: "user_id", name: "order_ordernote_user_id_7bd3c9932362ad7_fk_auth_user_id"
  add_foreign_key "order_ordernote", "order_order", column: "order_id", name: "order_ordernote_order_id_66b5007d4b8811fc_fk_order_order_id"
  add_foreign_key "order_paymentevent", "order_order", column: "order_id", name: "order_paymentevent_order_id_5519ad720fb419e3_fk_order_order_id"
  add_foreign_key "order_paymentevent", "order_paymenteventtype", column: "event_type_id", name: "ord_event_type_id_249ff8092c6d43a3_fk_order_paymenteventtype_id"
  add_foreign_key "order_paymentevent", "order_shippingevent", column: "shipping_event_id", name: "or_shipping_event_id_6877aec373154cfd_fk_order_shippingevent_id"
  add_foreign_key "order_paymenteventquantity", "order_line", column: "line_id", name: "order_paymenteventqua_line_id_642a7ca0fc82c848_fk_order_line_id"
  add_foreign_key "order_paymenteventquantity", "order_paymentevent", column: "event_id", name: "order_paymen_event_id_78990264223b4d05_fk_order_paymentevent_id"
  add_foreign_key "order_shippingaddress", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "or_country_id_3d3681191865f92d_fk_address_country_iso_3166_1_a2"
  add_foreign_key "order_shippingevent", "order_order", column: "order_id", name: "order_shippingevent_order_id_3e5a635a11a5efe3_fk_order_order_id"
  add_foreign_key "order_shippingevent", "order_shippingeventtype", column: "event_type_id", name: "or_event_type_id_68dea54081630023_fk_order_shippingeventtype_id"
  add_foreign_key "order_shippingeventquantity", "order_line", column: "line_id", name: "order_shippingeventqu_line_id_36250606f0d220d8_fk_order_line_id"
  add_foreign_key "order_shippingeventquantity", "order_shippingevent", column: "event_id", name: "order_shipp_event_id_7ed2b0f22378091b_fk_order_shippingevent_id"
  add_foreign_key "partner_partner_users", "auth_user", column: "user_id", name: "partner_partner_users_user_id_60c92c6366cc35df_fk_auth_user_id"
  add_foreign_key "partner_partner_users", "partner_partner", column: "partner_id", name: "partner_partn_partner_id_11078b82a267dd0a_fk_partner_partner_id"
  add_foreign_key "partner_partneraddress", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "pa_country_id_223e5808688af75a_fk_address_country_iso_3166_1_a2"
  add_foreign_key "partner_partneraddress", "partner_partner", column: "partner_id", name: "partner_partn_partner_id_7fa1550abac5d4e0_fk_partner_partner_id"
  add_foreign_key "partner_stockalert", "partner_stockrecord", column: "stockrecord_id", name: "partn_stockrecord_id_34e94cea034a1fac_fk_partner_stockrecord_id"
  add_foreign_key "partner_stockrecord", "catalogue_product", column: "product_id", name: "partner_sto_product_id_7c771a2453e7bc5c_fk_catalogue_product_id"
  add_foreign_key "partner_stockrecord", "partner_partner", column: "partner_id", name: "partner_stock_partner_id_1199cf31e68e4eaf_fk_partner_partner_id"
  add_foreign_key "payment_bankcard", "auth_user", column: "user_id", name: "payment_bankcard_user_id_50f8af2782d0260_fk_auth_user_id"
  add_foreign_key "payment_source", "order_order", column: "order_id", name: "payment_source_order_id_43d0eb2d35f2520_fk_order_order_id"
  add_foreign_key "payment_source", "payment_sourcetype", column: "source_type_id", name: "payment_source_type_id_a751a80c0e68466_fk_payment_sourcetype_id"
  add_foreign_key "payment_transaction", "payment_source", column: "source_id", name: "payment_transac_source_id_5cd2c63af44fbe4d_fk_payment_source_id"
  add_foreign_key "promotions_keywordpromotion", "django_content_type", column: "content_type_id", name: "prom_content_type_id_524dcef3affb28b1_fk_django_content_type_id"
  add_foreign_key "promotions_multiimage_images", "promotions_image", column: "image_id", name: "promotions_mul_image_id_60e822b0b601e090_fk_promotions_image_id"
  add_foreign_key "promotions_multiimage_images", "promotions_multiimage", column: "multiimage_id", name: "prom_multiimage_id_616aec69f371988f_fk_promotions_multiimage_id"
  add_foreign_key "promotions_orderedproduct", "catalogue_product", column: "product_id", name: "promotions_o_product_id_aa08538fdbd3c51_fk_catalogue_product_id"
  add_foreign_key "promotions_orderedproduct", "promotions_handpickedproductlist", column: "list_id", name: "D20f2bb2427c117b4c33f060a3109f49"
  add_foreign_key "promotions_orderedproductlist", "promotions_handpickedproductlist", column: "handpickedproductlist_ptr_id", name: "e63c27f0de5e150d130bd2f2ee18919e"
  add_foreign_key "promotions_orderedproductlist", "promotions_tabbedblock", column: "tabbed_block_id", name: "p_tabbed_block_id_7786a0b53088d9e5_fk_promotions_tabbedblock_id"
  add_foreign_key "promotions_pagepromotion", "django_content_type", column: "content_type_id", name: "prom_content_type_id_3d9e900a14215188_fk_django_content_type_id"
  add_foreign_key "promotions_singleproduct", "catalogue_product", column: "product_id", name: "promotions__product_id_357679e0ff345830_fk_catalogue_product_id"
  add_foreign_key "reviews_productreview", "auth_user", column: "user_id", name: "reviews_productreview_user_id_31afa2af52e840ea_fk_auth_user_id"
  add_foreign_key "reviews_productreview", "catalogue_product", column: "product_id", name: "reviews_pro_product_id_6c08e35ade7fcc46_fk_catalogue_product_id"
  add_foreign_key "reviews_vote", "auth_user", column: "user_id", name: "reviews_vote_user_id_8de4310fc00d25b_fk_auth_user_id"
  add_foreign_key "reviews_vote", "reviews_productreview", column: "review_id", name: "reviews__review_id_52f2fc8e02cac687_fk_reviews_productreview_id"
  add_foreign_key "shipping_orderanditemcharges_countries", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "sh_country_id_2035fdd696211879_fk_address_country_iso_3166_1_a2"
  add_foreign_key "shipping_orderanditemcharges_countries", "shipping_orderanditemcharges", column: "orderanditemcharges_id", name: "ce8733b75dd4d69da2ee24f7808592ba"
  add_foreign_key "shipping_weightband", "shipping_weightbased", column: "method_id", name: "shipping__method_id_57eabc4f1dd6b688_fk_shipping_weightbased_id"
  add_foreign_key "shipping_weightbased_countries", "address_country", column: "country_id", primary_key: "iso_3166_1_a2", name: "sh_country_id_67d32ca0ffef52b5_fk_address_country_iso_3166_1_a2"
  add_foreign_key "shipping_weightbased_countries", "shipping_weightbased", column: "weightbased_id", name: "ship_weightbased_id_4c6c33f5afc0ab8d_fk_shipping_weightbased_id"
  add_foreign_key "taggit_taggeditem", "django_content_type", column: "content_type_id", name: "tagg_content_type_id_488cfcf866cf5411_fk_django_content_type_id"
  add_foreign_key "taggit_taggeditem", "taggit_tag", column: "tag_id", name: "taggit_taggeditem_tag_id_343d05a81af7ea3c_fk_taggit_tag_id"
  add_foreign_key "training_aboutpage", "wagtailcore_page", column: "page_ptr_id", name: "training_ab_page_ptr_id_630ced9cf37c40ae_fk_wagtailcore_page_id"
  add_foreign_key "training_affinitytraininglandingpage", "wagtailcore_page", column: "page_ptr_id", name: "training_af_page_ptr_id_47da66d13d80d923_fk_wagtailcore_page_id"
  add_foreign_key "training_carecertificatecourseindex", "wagtailcore_page", column: "page_ptr_id", name: "training_ca_page_ptr_id_34f9a7af5f6e5f2f_fk_wagtailcore_page_id"
  add_foreign_key "training_careerpage", "wagtailcore_page", column: "page_ptr_id", name: "training_ca_page_ptr_id_2b75872d4a08dec3_fk_wagtailcore_page_id"
  add_foreign_key "training_careerpage", "wagtailimages_image", column: "detail_image_id", name: "trai_detail_image_id_65bfbd1f0f0fa254_fk_wagtailimages_image_id"
  add_foreign_key "training_careerpage", "wagtailimages_image", column: "index_image_id", name: "traini_index_image_id_ca890767a9eebc6_fk_wagtailimages_image_id"
  add_foreign_key "training_careersindex", "wagtailcore_page", column: "page_ptr_id", name: "training_ca_page_ptr_id_79525d3530b85f35_fk_wagtailcore_page_id"
  add_foreign_key "training_cityandguildspage", "wagtailcore_page", column: "page_ptr_id", name: "training_ci_page_ptr_id_3f0ab84e3a806e0a_fk_wagtailcore_page_id"
  add_foreign_key "training_contactspage", "wagtailcore_page", column: "page_ptr_id", name: "training_co_page_ptr_id_252335d3197a1653_fk_wagtailcore_page_id"
  add_foreign_key "training_course", "catalogue_product", column: "course_product_id", name: "trai_course_product_id_52a94ae163e3f2d2_fk_catalogue_product_id"
  add_foreign_key "training_course", "wagtailcore_page", column: "page_ptr_id", name: "training_co_page_ptr_id_5b2631a6f9cc936a_fk_wagtailcore_page_id"
  add_foreign_key "training_course", "wagtailimages_image", column: "icon_id", name: "training_cou_icon_id_726dbffc404d60c7_fk_wagtailimages_image_id"
  add_foreign_key "training_course", "wagtailimages_image", column: "inverted_icon_id", name: "trai_inverted_icon_id_255927e444012bb_fk_wagtailimages_image_id"
  add_foreign_key "training_coursedocument", "training_course", column: "page_id", primary_key: "page_ptr_id", name: "trainin_page_id_3d3e093885b8bd9d_fk_training_course_page_ptr_id"
  add_foreign_key "training_coursedocument", "wagtaildocs_document", column: "document_id", name: "trainin_document_id_47c85a76f7879bc9_fk_wagtaildocs_document_id"
  add_foreign_key "training_courseindex", "wagtailcore_page", column: "page_ptr_id", name: "training_co_page_ptr_id_5d77d9a4d7b0e8cf_fk_wagtailcore_page_id"
  add_foreign_key "training_courseinformationpage", "wagtailcore_page", column: "page_ptr_id", name: "training_co_page_ptr_id_131bb72ff798eb22_fk_wagtailcore_page_id"
  add_foreign_key "training_coursereview", "training_course", column: "page_id", primary_key: "page_ptr_id", name: "trainin_page_id_2bb063054ba2758f_fk_training_course_page_ptr_id"
  add_foreign_key "training_coursesession", "training_course", column: "page_id", primary_key: "page_ptr_id", name: "trainin_page_id_77081755daa0a203_fk_training_course_page_ptr_id"
  add_foreign_key "training_dementiacourseindex", "wagtailcore_page", column: "page_ptr_id", name: "training_de_page_ptr_id_3884c81b4927d1d8_fk_wagtailcore_page_id"
  add_foreign_key "training_faqspage", "wagtailcore_page", column: "page_ptr_id", name: "training_fa_page_ptr_id_3a0be5de75b3be81_fk_wagtailcore_page_id"
  add_foreign_key "training_formpage", "wagtailcore_page", column: "page_ptr_id", name: "training_fo_page_ptr_id_3ace75a341f42307_fk_wagtailcore_page_id"
  add_foreign_key "training_formpageformfield", "training_formpage", column: "page_id", primary_key: "page_ptr_id", name: "train_page_id_2152f2ffdfbfbb51_fk_training_formpage_page_ptr_id"
  add_foreign_key "training_homepage", "wagtailcore_page", column: "page_ptr_id", name: "training_ho_page_ptr_id_4dc9a6ccd789928d_fk_wagtailcore_page_id"
  add_foreign_key "training_homepagefeaturedcourse", "training_course", column: "course_id", primary_key: "page_ptr_id", name: "train_course_id_2d96e9cc0f927bc5_fk_training_course_page_ptr_id"
  add_foreign_key "training_homepagefeaturedcourse", "training_homepage", column: "page_id", primary_key: "page_ptr_id", name: "train_page_id_62f51f5c7d70c0ad_fk_training_homepage_page_ptr_id"
  add_foreign_key "training_lmspage", "wagtailcore_page", column: "page_ptr_id", name: "training_lm_page_ptr_id_63cad2e94e81158f_fk_wagtailcore_page_id"
  add_foreign_key "training_newsarticle", "wagtailcore_page", column: "page_ptr_id", name: "training_ne_page_ptr_id_3564f68aacfcd90a_fk_wagtailcore_page_id"
  add_foreign_key "training_newsarticle", "wagtailimages_image", column: "detail_image_id", name: "trainin_detail_image_id_6852a27d9d123_fk_wagtailimages_image_id"
  add_foreign_key "training_newsarticle", "wagtailimages_image", column: "index_image_id", name: "train_index_image_id_2629ba4f683dde43_fk_wagtailimages_image_id"
  add_foreign_key "training_newsindex", "wagtailcore_page", column: "page_ptr_id", name: "training_ne_page_ptr_id_4c50f5facf55e611_fk_wagtailcore_page_id"
  add_foreign_key "training_privacypolicypage", "wagtailcore_page", column: "page_ptr_id", name: "training_pr_page_ptr_id_1b13eff620b293a9_fk_wagtailcore_page_id"
  add_foreign_key "training_staffindex", "wagtailcore_page", column: "page_ptr_id", name: "training_st_page_ptr_id_484d027cd0becd6d_fk_wagtailcore_page_id"
  add_foreign_key "training_staffmember", "wagtailcore_page", column: "page_ptr_id", name: "training_sta_page_ptr_id_dabb9c0e205ecba_fk_wagtailcore_page_id"
  add_foreign_key "training_staffmember", "wagtailimages_image", column: "profile_photo_id", name: "trai_profile_photo_id_fc225f315532812_fk_wagtailimages_image_id"
  add_foreign_key "training_taggedcoursecategory", "taggit_tag", column: "tag_id", name: "training_taggedcoursec_tag_id_32dea29147947fd2_fk_taggit_tag_id"
  add_foreign_key "training_taggedcoursecategory", "training_course", column: "content_object_id", primary_key: "page_ptr_id", name: "D3821216bc61e184c34355c9e300e53c"
  add_foreign_key "training_taggedcoursecity", "taggit_tag", column: "tag_id", name: "training_taggedcourseci_tag_id_3af27e5ed3668cc_fk_taggit_tag_id"
  add_foreign_key "training_taggedcoursecity", "training_course", column: "content_object_id", primary_key: "page_ptr_id", name: "f49aa27bc2a173590882d8285b205258"
  add_foreign_key "training_taggedcourseexpertisearea", "taggit_tag", column: "tag_id", name: "training_taggedcoursee_tag_id_6c683735ac561050_fk_taggit_tag_id"
  add_foreign_key "training_taggedcourseexpertisearea", "training_course", column: "content_object_id", primary_key: "page_ptr_id", name: "D33c99b5f0850105e2bc8761796fe41a"
  add_foreign_key "training_termsandconditionspage", "wagtailcore_page", column: "page_ptr_id", name: "training_te_page_ptr_id_4f3616d89b3ff0a8_fk_wagtailcore_page_id"
  add_foreign_key "voucher_voucher_offers", "offer_conditionaloffer", column: "conditionaloffer_id", name: "D2088af8ad0eb4b1e4699805e5939a44"
  add_foreign_key "voucher_voucher_offers", "voucher_voucher", column: "voucher_id", name: "voucher_vouche_voucher_id_1aed4a9f741d918_fk_voucher_voucher_id"
  add_foreign_key "voucher_voucherapplication", "auth_user", column: "user_id", name: "voucher_voucherapplica_user_id_6919d22cd3a864ba_fk_auth_user_id"
  add_foreign_key "voucher_voucherapplication", "order_order", column: "order_id", name: "voucher_voucherappl_order_id_473f5d40992427e7_fk_order_order_id"
  add_foreign_key "voucher_voucherapplication", "voucher_voucher", column: "voucher_id", name: "voucher_vouch_voucher_id_3de1b59a21059fce_fk_voucher_voucher_id"
  add_foreign_key "wagtailcore_groupcollectionpermission", "auth_group", column: "group_id", name: "wagtailcore_groupcol_group_id_5028587d90d44d04_fk_auth_group_id"
  add_foreign_key "wagtailcore_groupcollectionpermission", "auth_permission", column: "permission_id", name: "wagtailcor_permission_id_2d14a750cad0d6f7_fk_auth_permission_id"
  add_foreign_key "wagtailcore_groupcollectionpermission", "wagtailcore_collection", column: "collection_id", name: "wag_collection_id_3a29252415ca6e09_fk_wagtailcore_collection_id"
  add_foreign_key "wagtailcore_grouppagepermission", "auth_group", column: "group_id", name: "wagtailcore_grouppag_group_id_305f4733f2c09110_fk_auth_group_id"
  add_foreign_key "wagtailcore_grouppagepermission", "wagtailcore_page", column: "page_id", name: "wagtailcore_gro_page_id_21a522e4a6fcb1cc_fk_wagtailcore_page_id"
  add_foreign_key "wagtailcore_page", "auth_user", column: "owner_id", name: "wagtailcore_page_owner_id_6e5aded5e152a541_fk_auth_user_id"
  add_foreign_key "wagtailcore_page", "django_content_type", column: "content_type_id", name: "wagt_content_type_id_26b53edb4e00f920_fk_django_content_type_id"
  add_foreign_key "wagtailcore_pagerevision", "auth_user", column: "user_id", name: "wagtailcore_pagerevisi_user_id_54a4c32a3f54fab5_fk_auth_user_id"
  add_foreign_key "wagtailcore_pagerevision", "wagtailcore_page", column: "page_id", name: "wagtailcore_pag_page_id_6c504a8d7a4bbdaf_fk_wagtailcore_page_id"
  add_foreign_key "wagtailcore_pageviewrestriction", "wagtailcore_page", column: "page_id", name: "wagtailcore_pag_page_id_4339587f3e8f741d_fk_wagtailcore_page_id"
  add_foreign_key "wagtailcore_site", "wagtailcore_page", column: "root_page_id", name: "wagtailcor_root_page_id_7bace5c1d2345094_fk_wagtailcore_page_id"
  add_foreign_key "wagtaildocs_document", "auth_user", column: "uploaded_by_user_id", name: "wagtaildoc_uploaded_by_user_id_1cbcb8da37c1c691_fk_auth_user_id"
  add_foreign_key "wagtaildocs_document", "wagtailcore_collection", column: "collection_id", name: "wag_collection_id_2b3c3cd6e66fd24f_fk_wagtailcore_collection_id"
  add_foreign_key "wagtailforms_formsubmission", "wagtailcore_page", column: "page_id", name: "wagtailforms_fo_page_id_27a1dcc5f03cd11c_fk_wagtailcore_page_id"
  add_foreign_key "wagtailimages_image", "auth_user", column: "uploaded_by_user_id", name: "wagtailima_uploaded_by_user_id_3cf6df65b056acde_fk_auth_user_id"
  add_foreign_key "wagtailimages_image", "wagtailcore_collection", column: "collection_id", name: "wag_collection_id_6ded88bff080bbb8_fk_wagtailcore_collection_id"
  add_foreign_key "wagtailimages_rendition", "wagtailimages_filter", column: "filter_id", name: "wagtailim_filter_id_45e66d8cf5b90f41_fk_wagtailimages_filter_id"
  add_foreign_key "wagtailimages_rendition", "wagtailimages_image", column: "image_id", name: "wagtailimag_image_id_41bafc80e6b0515e_fk_wagtailimages_image_id"
  add_foreign_key "wagtailredirects_redirect", "wagtailcore_page", column: "redirect_page_id", name: "wagtail_redirect_page_id_de4705f480ac10e_fk_wagtailcore_page_id"
  add_foreign_key "wagtailredirects_redirect", "wagtailcore_site", column: "site_id", name: "wagtailredirect_site_id_436e5ceb31775ddd_fk_wagtailcore_site_id"
  add_foreign_key "wagtailsearch_editorspick", "wagtailcore_page", column: "page_id", name: "wagtailsearch_e_page_id_74b75f1634552093_fk_wagtailcore_page_id"
  add_foreign_key "wagtailsearch_editorspick", "wagtailsearch_query", column: "query_id", name: "wagtailsear_query_id_401d6bc82b45fcf8_fk_wagtailsearch_query_id"
  add_foreign_key "wagtailsearch_querydailyhits", "wagtailsearch_query", column: "query_id", name: "wagtailsear_query_id_1068d246276fc19b_fk_wagtailsearch_query_id"
  add_foreign_key "wagtailusers_userprofile", "auth_user", column: "user_id", name: "wagtailusers_userprofi_user_id_4ed787dc7f17d6b4_fk_auth_user_id"
  add_foreign_key "wishlists_line", "catalogue_product", column: "product_id", name: "wishlists_l_product_id_163c64c2f95a79de_fk_catalogue_product_id"
  add_foreign_key "wishlists_line", "wishlists_wishlist", column: "wishlist_id", name: "wishlists_wishlist_id_14e4801d21469fc8_fk_wishlists_wishlist_id"
  add_foreign_key "wishlists_wishlist", "auth_user", column: "owner_id", name: "wishlists_wishlist_owner_id_22c437a28f7f7a37_fk_auth_user_id"
end
