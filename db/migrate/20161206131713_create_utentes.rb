class CreateUtentes < ActiveRecord::Migration
  def change
    create_table :utentes do |t|
      t.string :nome
      t.string :email
      t.integer :età
      t.string :sesso
      t.string :idg

      t.timestamps null: false
    end
  end
end
