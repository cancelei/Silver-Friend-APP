class CreateDimAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :dim_availabilities do |t|
      t.references :provider, null: false, foreign_key: { to_table: :dim_providers }
      t.references :service, null: false, foreign_key: { to_table: :dim_services }
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end

    add_index :dim_availabilities, [:provider_id, :service_id, :start_time, :end_time], unique: true, name: 'index_dim_availabilities_on_provider_service_and_times'
  end
end
