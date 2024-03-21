class CreateDimAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :dim_addresses do |t|
      t.string :origin_table
      t.integer :origin_id
      t.string :postal_code
      t.string :street
      t.string :neighborhood
      t.string :number
      t.string :complement

      t.timestamps
    end
    add_index :dim_addresses, [:origin_table, :origin_id]
  end
end
