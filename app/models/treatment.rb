class Treatment < ApplicationRecord
  has_many :patient_treatments
  has_many :patients, through: :patient_treatments
end
