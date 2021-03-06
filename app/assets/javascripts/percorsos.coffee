# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
changeBackground = ->
  if $('label[for=percorso_data]').length
    $("body").css "background-image", "url('../../assets/new_percorso.jpg')"
    $("body").css "background-size", "cover"

# Run with turbolinks.
$(document).on 'turbolinks:load', ->
  changeBackground()
  $('.rispondi').click ->
    $(this).slideUp()
      .closest '.message_div'
      .children '.messageArea'
      .slideDown()
  $('.message_cancella').click ->
    $(this).closest '.messageArea'
      .slideUp()
      .closest '.message_div'
      .find '.rispondi'
      .slideDown()
  $('.message_invia').click ->
    $(this).closest '.messageArea'
      .attr 'id', 'sending'
    $(this).closest 'form'
      .submit()
  $('#link_photo').click ->
    $(this).slideUp 'slow', ->
      $('#photo_container').slideDown 'slow'
  $('#cancella_photo').click ->
    $('#photo_container').slideUp 'slow', ->
      $('#link_photo').slideDown 'slow'
  $('#aggiorna_photo').click ->
    $(this).closest 'form'
      .submit()
