json.extract! utente, :id, :nome, :email, :età, :sesso, :idg, :created_at, :updated_at
json.url utente_url(utente, format: :json)