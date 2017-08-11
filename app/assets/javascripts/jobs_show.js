$(document).ready(function() {
  $("#new_request").hide();
  $(".btn-js").on("click", function() {
    if ($("#new_request").is(":visible"))
    {
      $("#new_request").slideUp();
    }
    else
    {
      $("#new_request").slideDown();
    }
  })
})
