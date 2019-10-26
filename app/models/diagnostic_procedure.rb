class DiagnosticProcedure < ApplicationRecord
  has_many :patient_diagnostic_procedures
  has_many :patients, through: :patient_diagnostic_procedures
end
