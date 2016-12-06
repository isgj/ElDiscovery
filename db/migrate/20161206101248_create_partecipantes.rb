class CreatePartecipantes < ActiveRecord::Migration
  def change
    create_table :partecipantes do |t|
      t.string :percorso
      t.string :utente

      t.timestamps null: false
    end
  end
end
