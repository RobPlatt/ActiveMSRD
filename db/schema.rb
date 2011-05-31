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

ActiveRecord::Schema.define(:version => 20110531161439) do

  create_table "character_levels", :force => true do |t|
    t.integer  "character_id"
    t.integer  "level"
    t.integer  "hit_die_roll"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "class_level_id"
  end

  create_table "character_skills", :force => true do |t|
    t.integer  "character_id"
    t.integer  "skill_id"
    t.integer  "ranks",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "code"
    t.integer  "starting_str", :default => 10
    t.integer  "starting_dex", :default => 10
    t.integer  "starting_con", :default => 10
    t.integer  "starting_int", :default => 10
    t.integer  "starting_wis", :default => 10
    t.integer  "starting_cha", :default => 10
    t.integer  "race_id",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_hero"
  end

  create_table "class_levels", :force => true do |t|
    t.integer  "modern_class_id"
    t.integer  "level"
    t.integer  "bab",              :default => 0
    t.integer  "base_fort",        :default => 0
    t.integer  "base_ref",         :default => 0
    t.integer  "base_will",        :default => 0
    t.integer  "defence_bonus",    :default => 0
    t.integer  "reputation_bonus", :default => 0
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_skills", :force => true do |t|
    t.integer  "modern_class_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modern_classes", :force => true do |t|
    t.string   "class_name"
    t.integer  "skill_points"
    t.integer  "action_points"
    t.integer  "hit_die"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "primary_stat"
    t.string   "bab",              :default => "half"
    t.boolean  "good_fort",        :default => false
    t.boolean  "good_ref",         :default => false
    t.boolean  "good_will",        :default => false
    t.string   "defence_bonus",    :default => "average"
    t.string   "reputation_bonus", :default => "average"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "size",        :default => "medium"
    t.integer  "base_speed",  :default => 30
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "stable"
  end

  create_table "skills", :force => true do |t|
    t.string   "skill_name"
    t.boolean  "trained_only",  :default => false
    t.boolean  "armor_penalty", :default => false
    t.string   "key_ability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
