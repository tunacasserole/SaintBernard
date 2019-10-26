class MedicationOrder < ApplicationRecord
  has_many :patient_medication_orders
  has_many :patients, through: :patient_medication_orders
  belongs_to :order_frequency

  enum route: [:po, :im, :sc]

  def display_name
    "#{name} #{dosage.round} #{route.upcase} #{order_frequency.value} to #{necessity}"
  end
end
