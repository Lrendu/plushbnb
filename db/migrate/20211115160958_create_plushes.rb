class CreatePlushes < ActiveRecord::Migration[6.0]
  def change
    create_table :plushes do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
