class CreateFactAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :fact_appointments do |t|
      t.references :user, null: false
      t.references :service, null: false
      t.references :provider, null: false
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :status
      t.decimal :amount_paid, precision: 10, scale: 2

      t.timestamps
    end
  end
end
