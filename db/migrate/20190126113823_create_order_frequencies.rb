class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
 def up
    create_table :order_frequencies do |t|
      t.string :value
      t.string :unit
      t.timestamps
    end
  end

  def down
    drop_table :order_frequencies
  end
end
