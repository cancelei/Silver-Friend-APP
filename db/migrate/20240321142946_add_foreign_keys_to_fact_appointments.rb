class AddForeignKeysToFactAppointments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :fact_appointments, :dim_users, column: :user_id
    add_foreign_key :fact_appointments, :dim_services, column: :service_id
    add_foreign_key :fact_appointments, :dim_providers, column: :provider_id
  end
end
