# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
updateOptionFields = (selected, fields) ->
  $("div[class*='op-']").hide()
  for opt,_ of fields[selected].options
    $("div.op-#{opt}").show()

updateOptionFieldsValues = (selected, fields) ->
  for opt, val of fields[selected].default
    $("input#field_#{opt}").val(val)
jQuery ->
  $('ul#fields').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.ajax
        url: $(this).data('update-url')
        type: 'PUT'
        data: $(this).sortable('serialize')
        success: ->
          console.log 'success!!'
  $('select#field_type').change ->
    fields = $(this).data('fields')
    $('select#field_type option:selected').each ->
      updateOptionFields($(this).val(),fields)
      updateOptionFieldsValues($(this).val(), fields)
$('select#field_type').ready ->
    fields = $(this).data('fields')
    $('select#field_type option:selected').each ->
      updateOptionFields($(this).val(),fields)


