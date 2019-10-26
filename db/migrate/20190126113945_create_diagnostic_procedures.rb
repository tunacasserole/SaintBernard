class CreateDiagnosticProcedures < ActiveRecord::Migration[5.2]
 def up
    create_table :diagnostic_procedures do |t|
      t.text :description
      t.datetime :moment
      t.timestamps
    end

    create_table :patient_diagnostic_procedures, id: false do |t|
      t.references :diagnostic_procedure, null: false
      t.references :patient, null: false
    end
  end

  def down
    drop_table :diagnostic_procedures
    drop_table :patient_diagnostic_procedures
  end
end
