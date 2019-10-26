class Allergy < ApplicationRecord
  has_many :patient_allergies
  has_many :patients, through: :patient_allergies
end
