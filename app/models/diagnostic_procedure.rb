class DiagnosticProcedure < ApplicationRecord
  has_many :patient_diagnostic_procedures
  has_many :patients, through: :patient_diagnostic_procedures

  def display_name
    "#{description} on #{moment.to_formatted_s(:long).chop.chop.chop.chop.chop} at #{moment.strftime('%H:%M')}"
  end
end
