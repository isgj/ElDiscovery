json.extract! percorso, :id, :data, :ora, :partenza, :destinazione, :durata, :utref, :created_at, :updated_at
json.url percorso_url(percorso, format: :json)