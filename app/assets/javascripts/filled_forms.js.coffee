# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$.attachinary.config.template = "
  <ul class='media-list'>
    <% for(var i=0; i<files.length; i++){ %>
      <li class='media'>
        <a target='_blank' class='pull-left' href='<%= $.cloudinary.url(files[i].public_id, { 'version': files[i].version, 'format': 'jpg' }) %>'>
          <img src='<%= $.cloudinary.url(files[i].public_id, { 'version': files[i].version, 'format': 'jpg', 'crop': 'fill', 'width': 75, 'height': 75 }) %>' alt='' width='75' height='75' />
        </a>
        <div class='media-body'>
          <h4>تصویر</h4>
          <a href='#' data-remove='<%= files[i].public_id %>'>&times; حذف</a>
        </div>
      </li>
    <% } %>
  </ul>"
jQuery ->
  $('.attachinary-input').attachinary()
