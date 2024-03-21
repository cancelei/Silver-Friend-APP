class AddUserRefToDimProviders < ActiveRecord::Migration[7.1]
  def change
    add_reference :dim_providers, :dim_user, foreign_key: true
  end
end
