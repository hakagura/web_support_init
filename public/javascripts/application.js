$(document).ready(function() {
  setTimeout(hideFlashes, 2500);
});

var hideFlashes = function() {
  $('.alert-message, #flash_warning, #flash_alert, #flash_error').fadeOut(1500);
}