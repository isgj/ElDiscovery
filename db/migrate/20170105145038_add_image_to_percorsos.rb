class AddImageToPercorsos < ActiveRecord::Migration
  def change
    add_column :percorsos, :image, :string
  end
end
