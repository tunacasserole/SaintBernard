class Admission < ApplicationRecord
  has_one :patient

  has_many :admission_diagnoses
  has_many :diagnoses, through: :admission_diagnoses

  has_many :admission_symptoms
  has_many :symptoms, through: :admission_symptoms

  has_many :admission_observations
  has_many :observations, through: :admission_observations
end
