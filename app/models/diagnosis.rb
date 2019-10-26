class Diagnosis < ApplicationRecord
  has_many :patient_diagnoses
  has_many :patients, through: :patient_diagnoses

  has_many :chronic_conditions, through: :patient_diagnoses, source: :diagnosis

  has_many :admissions_diagnoses
  has_many :admissions, through: :admission_diagnoses

  scope :chronic, -> { where(coding_system: 'CHRONIC') }
  scope :not_chronic, -> { where(coding_system: nil) }

  def display_name
    "#{description} (#{code})"
  end
end
