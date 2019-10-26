class CreateTreatments < ActiveRecord::Migration[5.2]

 def up
    create_table :treatments do |t|
      t.text :description
      t.text :necessity
      t.timestamps
    end

    create_table :patient_treatments, id: false do |t|
      t.references :treatment, null: false
      t.references :patient, null: false
    end
  end

  def down
    drop_table :treatments
    drop_table :patient_treatments
  end
end
