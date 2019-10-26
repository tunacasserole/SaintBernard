class CreateAdmissions < ActiveRecord::Migration[5.2]
  def up
    create_table :admissions do |t|
      t.datetime :moment
      t.timestamps
    end

    create_table :admission_diagnoses, id: false do |t|
      t.references :admission, null: false
      t.references :diagnosis, null: false
    end

    create_table :admission_symptoms, id: false do |t|
      t.references :admission, null: false
      t.references :symptom, null: false
    end

    create_table :admission_observations, id: false do |t|
      t.references :admission, null: false
      t.references :observation, null: false
    end
  end

  def down
    drop_table :admissions
    drop_table :admission_diagnoses
    drop_table :admission_symptoms
    drop_table :admission_observations
  end
end
