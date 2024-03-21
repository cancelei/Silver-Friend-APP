class CreateDimServices < ActiveRecord::Migration[7.1]
  def change
    create_table :dim_services do |t|
      t.references :provider, null: false, foreign_key: { to_table: :dim_providers }
      t.string :name
      t.text :description
      t.integer :estimated_duration
      t.decimal :price, precision: 10, scale: 2
      t.string :type

      t.timestamps
    end
  end
end
