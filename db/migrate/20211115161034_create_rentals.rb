class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :date
      t.references :tenant, null: false, foreign_key: { to_table: :users }
      t.references :plush, null: false, foreign_key: true

      t.timestamps
    end
  end
end
