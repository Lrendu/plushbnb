class AddCoordinatestoPlushes < ActiveRecord::Migration[6.0]
  def change
    add_column :plushes, :latitude, :float
    add_column :plushes, :longitude, :float
  end
end
