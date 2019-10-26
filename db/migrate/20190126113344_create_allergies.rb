class CreateAllergies < ActiveRecord::Migration[5.2]
  def up
    create_table :allergies do |t|
      t.text :description
      t.timestamps
    end

    create_table :patient_allergies, id: false do |t|
      t.references :allergy, null: false
      t.references :patient, null: false
    end
  end

  def down
    drop_table :allergies
    drop_table :patient_allergies
  end
end
