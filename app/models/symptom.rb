class Symptom < ApplicationRecord
  has_many :admissions_symptoms
  has_many :admissions, through: :admissions_symptoms
end
