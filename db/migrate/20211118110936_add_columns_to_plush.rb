class AddColumnsToPlush < ActiveRecord::Migration[6.0]
  def change
    add_column :plushes, :color, :string
    add_column :plushes, :size, :string
  end
end
