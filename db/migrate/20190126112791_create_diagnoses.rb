class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def up
    create_table :diagnoses do |t|
      t.string :coding_system
      t.string :code
      t.text :description
      t.timestamps
    end

    create_table :patient_diagnoses, id: false do |t|
      t.references :diagnosis, null: false
      t.references :patient, null: false
    end
  end

  def down
    drop_table :diagnoses
    drop_table :patient_diagnoses
  end
end
