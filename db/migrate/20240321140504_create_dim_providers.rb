class CreateDimProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :dim_providers do |t|
      t.references :user, null: false
      t.text :description
      t.boolean :documentation_approved
      t.boolean :specific_service_qualified

      t.timestamps
    end
  end
end
