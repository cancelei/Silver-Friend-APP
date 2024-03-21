class RenameOriginColumnsInDimAddresses < ActiveRecord::Migration[7.1]
  def change
    rename_column :dim_addresses, :origin_table, :addressable_type
    rename_column :dim_addresses, :origin_id, :addressable_id

    unless index_exists?(:dim_addresses, [:addressable_type, :addressable_id])
      add_index :dim_addresses, [:addressable_type, :addressable_id]
    end
  end
end
