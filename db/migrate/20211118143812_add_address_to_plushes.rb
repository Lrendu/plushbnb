class AddAddressToPlushes < ActiveRecord::Migration[6.0]
  def change
    add_column :plushes, :address, :string
  end
end
