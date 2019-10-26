class MedicationOrder < ApplicationRecord
  has_many :patient_medication_orders
  has_many :patients, through: :patient_medication_orders
  belongs_to :order_frequency
end
