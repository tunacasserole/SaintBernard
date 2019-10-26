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

ActiveRecord::Schema.define(version: 2019_01_26_114039) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.integer "diagnosis_id"
    t.integer "symptom_id"
    t.integer "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_admissions_on_diagnosis_id"
    t.index ["observation_id"], name: "index_admissions_on_observation_id"
    t.index ["symptom_id"], name: "index_admissions_on_symptom_id"
  end

  create_table "admissions_diagnoses", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "diagnosis_id", null: false
    t.index ["admission_id"], name: "index_admissions_diagnoses_on_admission_id"
    t.index ["diagnosis_id"], name: "index_admissions_diagnoses_on_diagnosis_id"
  end

  create_table "admissions_observations", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "observation_id", null: false
    t.index ["admission_id"], name: "index_admissions_observations_on_admission_id"
    t.index ["observation_id"], name: "index_admissions_observations_on_observation_id"
  end

  create_table "admissions_symptoms", id: false, force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "symptom_id", null: false
    t.index ["admission_id"], name: "index_admissions_symptoms_on_admission_id"
    t.index ["symptom_id"], name: "index_admissions_symptoms_on_symptom_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name"
    t.string "unit", default: "mg"
    t.string "dosage"
    t.string "frequency", default: "often"
    t.string "route", default: "PO"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.integer "gender_id"
    t.integer "admission_id"
    t.integer "medication_order_id"
    t.integer "diagnostic_procedure_id"
    t.integer "treatments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_patients_on_admission_id"
    t.index ["diagnostic_procedure_id"], name: "index_patients_on_diagnostic_procedure_id"
    t.index ["gender_id"], name: "index_patients_on_gender_id"
    t.index ["medication_order_id"], name: "index_patients_on_medication_order_id"
    t.index ["treatments_id"], name: "index_patients_on_treatments_id"
  end

  create_table "patients_allergies", id: false, force: :cascade do |t|
    t.integer "allergy_id", null: false
    t.integer "patient_id", null: false
    t.index ["allergy_id"], name: "index_patients_allergies_on_allergy_id"
    t.index ["patient_id"], name: "index_patients_allergies_on_patient_id"
  end

  create_table "patients_diagnoses", id: false, force: :cascade do |t|
    t.integer "diagnosis_id", null: false
    t.integer "patient_id", null: false
    t.index ["diagnosis_id"], name: "index_patients_diagnoses_on_diagnosis_id"
    t.index ["patient_id"], name: "index_patients_diagnoses_on_patient_id"
  end

  create_table "patients_diagnostic_procs", id: false, force: :cascade do |t|
    t.integer "diagnostic_procedure_id", null: false
    t.integer "patient_id", null: false
    t.index ["diagnostic_procedure_id"], name: "index_patients_diagnostic_procs_on_diagnostic_procedure_id"
    t.index ["patient_id"], name: "index_patients_diagnostic_procs_on_patient_id"
  end

  create_table "patients_medication_orders", id: false, force: :cascade do |t|
    t.integer "medication_order_id", null: false
    t.integer "patient_id", null: false
    t.index ["medication_order_id"], name: "index_patients_medication_orders_on_medication_order_id"
    t.index ["patient_id"], name: "index_patients_medication_orders_on_patient_id"
  end

  create_table "patients_treatments", id: false, force: :cascade do |t|
    t.integer "treatment_id", null: false
    t.integer "patient_id", null: false
    t.index ["patient_id"], name: "index_patients_treatments_on_patient_id"
    t.index ["treatment_id"], name: "index_patients_treatments_on_treatment_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
