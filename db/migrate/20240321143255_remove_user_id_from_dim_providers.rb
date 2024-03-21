class RemoveUserIdFromDimProviders < ActiveRecord::Migration[7.1]
  def change
    remove_column :dim_providers, :user_id, :bigint
  end
end
