$(document).ready(function() {
  $('.pages-home .navbar-bee').addClass('navbar-transparent');
  $('.pages-home .navbar-bee-right').addClass('hidden');
    $('.pages-home .navbar-bee-brand').addClass('hidden');

  $(window).scroll(function () {
    //if you hard code, then use console
    //.log to determine when you want the
    //nav bar to stick.
    // console.log($(window).scrollTop())
    if ($(window).scrollTop() > 50) {
      $('.pages-home .navbar-bee').removeClass('navbar-transparent');
      $('.pages-home .navbar-bee').addClass('navbar-opaque');
      $('.pages-home .navbar-bee-right').removeClass('hidden');
      $('.pages-home .navbar-bee-brand').removeClass('hidden');
    }
    if ($(window).scrollTop() < 51) {
      $('.pages-home .navbar-bee').removeClass('navbar-opaque');
      $('.pages-home .navbar-bee').addClass('navbar-transparent');
      $('.pages-home .navbar-bee-right').addClass('hidden');
      $('.pages-home .navbar-bee-brand').addClass('hidden');
    }
  });
});
