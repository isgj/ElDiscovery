class CreatePartecipantis < ActiveRecord::Migration
  def change
    create_table :partecipantis do |t|
      t.string :percorso
      t.string :utente

      t.timestamps null: false
    end
  end
end
