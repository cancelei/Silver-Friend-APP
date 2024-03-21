class CreateDimUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :dim_users do |t|
      t.string :cpf, limit: 11
      t.string :name
      t.string :email
      t.date :birth_date
      t.string :account_type

      t.timestamps
    end
  end
end
