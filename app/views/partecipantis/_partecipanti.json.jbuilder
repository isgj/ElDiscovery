json.extract! partecipanti, :id, :percorso, :utente, :created_at, :updated_at
json.url partecipanti_url(partecipanti, format: :json)