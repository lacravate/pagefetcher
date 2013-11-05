function checkPage(page) {
  $.ajax({
    url: '/pages/lookup?name=' + page,
    method: 'head',
    success: function() {
      $('#exists').show();
      $('#exists_not').hide();
    },
    error: function() {
      $('#exists').hide();
      if(!$('#page_external_id').val()) {
        $('#exists_not').hide();
      }
      else {
        $('#exists_not').show();
      }

    }
  });
}

$(document).ready(function() {
  $('div[class="controls"]').on('keyup', '#page_external_id', function(e) {
    checkPage($(this).val());
  });
});
