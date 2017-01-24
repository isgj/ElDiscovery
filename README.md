# El Discovery

El Discovery è una applicazione web che vuole aiutare gli utenti a condividere i viaggi.

---

### Esperienza utente

- Utenti non autenticati
	- consultazione dei viaggi avendo meno informazioni a disposizione
	- non partecipa ai viaggi
	- non interagisce con gli altri utenti
- Utenti autenticati
	- consultazione dei viaggi
	- creazione\partecipazione di viaggi
	- interagisce con gli altri utenti

---

### Specifiche tecniche

Il framework utilizzato è `Ruby on Rails`.
Per testare l'applicazione in locale si devono seguire questi passi:

- installare Ruby on Rails
- installare [RabbitMQ](https://www.rabbitmq.com)

Nella cartella `/config/initializers/` si deve creare un file col nome `omniauth.rb` con codice

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :google_oauth2, $CLIENT_ID, $CLIENT_SECRET,
  scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name:'google'
end
```

> Dove **CLIENT_ID** e **CLIENT_SECRET** si ottengono registrandosi su [Google Developer Console](https://console.developers.google.com)

- dal terminale
    - `bundle install`
    - `db:rake migrate`
    - `rails s`

---

### API REST

- Autenticazione
    + [Google Plus API](https://developers.google.com/+/web/api/rest/)
- Informazioni sul percorso
    + [Google Maps API](https://developers.google.com/maps/documentation/geocoding/start)
- Visualizzazione della mappa
    + [Google Maps](https://www.google.com/maps)
