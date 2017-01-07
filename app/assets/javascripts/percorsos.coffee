# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
changeBackground = ->
  if $('form[id*=_percorso]').length
    $("body").css "background-image", "url('../../assets/new_percorso.jpg')"
    $("body").css "background-size", "cover"

# Run with turbolinks.
$(document).on 'turbolinks:load', changeBackground
