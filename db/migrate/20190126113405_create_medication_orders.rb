class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def up
    create_table :medication_orders do |t|
      t.string :name
      t.integer :unit
      t.decimal :dosage
      t.integer :route
      t.text :necessity
      t.references :order_frequencies
      t.timestamps
    end

    create_table :patient_medication_orders, id: false do |t|
      t.references :medication_order, null: false
      t.references :patient, null: false
    end
  end

  def down
    drop_table :medication_orders
    drop_table :patient_medication_orders
  end
end
