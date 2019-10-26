class Patient < ApplicationRecord

  belongs_to :admission

  has_many :patient_allergies
  has_many :allergies, through: :patient_allergies

  has_many :patient_diagnoses
  has_many :diagnoses, through: :patient_diagnoses
  has_many :chronic_conditions, through: :patient_diagnoses, source: :diagnosis

  has_many :patient_diagnostic_procedures
  has_many :diagnostic_procedures, through: :patient_diagnostic_procedures

  has_many :patient_treatments
  has_many :treatments, through: :patient_treatments

  has_many :patient_medication_orders
  has_many :medication_orders, through: :patient_medication_orders

  enum gender: [:female, :male, :other]

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def medications
    medication_orders
  end
end
