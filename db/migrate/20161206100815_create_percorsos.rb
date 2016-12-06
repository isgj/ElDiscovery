class CreatePercorsos < ActiveRecord::Migration
  def change
    create_table :percorsos do |t|
      t.date :data
      t.time :ora
      t.string :partenza
      t.string :destinazione
      t.time :durata
      t.string :utref

      t.timestamps null: false
    end
  end
end
