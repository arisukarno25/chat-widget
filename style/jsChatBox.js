hideChat(0);

$('#prime').click(function() {
  toggleFab();
});


//Toggle chat and links
function toggleFab() {
  $('.prime').toggleClass('is-active');
  $('.prime').toggleClass('is-visible');
  $('#prime').toggleClass('is-float');
  $('.chat').toggleClass('is-visible');
  // hide spesific class
  // $('.chat_header').toggleClass('is-hide');
  $('.fab').toggleClass('is-visible');
  
}

  $('#submit-login').click(function(e) {
        hideChat(1);
  });


  // fullscreen mode 
  $('#chat_fullscreen_loader').click(function(e) {
      $('.fullscreen').toggleClass('zmdi-window-maximize');
      $('.fullscreen').toggleClass('zmdi-window-restore');
      $('.chat').toggleClass('chat_fullscreen');
      $('.fab').toggleClass('is-hide');
      $('.header_img').toggleClass('change_img');
      $('.img_container').toggleClass('change_img');
      $('.chat_header').toggleClass('chat_header2');
      $('.fab_field').toggleClass('fab_field2');
      $('.chat_converse').toggleClass('chat_converse2');
      //$('#chat_converse').css('display', 'none');
     // $('#chat_body').css('display', 'none');
     // $('#chat_form').css('display', 'none');
     // $('.chat_login').css('display', 'none');
     // $('#chat_fullscreen').css('display', 'block');
  });

function hideChat(hide) {
    switch (hide) {
      case 0:
            // default ya itu block atau tampil
            // access class = . | access id = #
            $('#chat_converse').css('display', 'none');
            $('#chat_header').css('display', 'none');
            $('#chat_body').css('display', 'none');
            $('#user-login').css('display', 'block');
            $('#chat_form').css('display', 'none');
            $('.chat_login').css('display', 'block');
            $('.fab_field').css('display', 'block');
            // $('.chat_header').css('display', 'none');
            $('.chat_body').css('display', 'block');
            $('.chat_fullscreen_loader').css('display', 'none');
            $('#chat_fullscreen').css('display', 'none');
            break;
      case 1:
            $('#chat_converse').css('display', 'block');
            $('#chat_body').css('display', 'none');
            $('#chat_form').css('display', 'none');
            $('.chat_login').css('display', 'none');
            $('.chat_fullscreen_loader').css('display', 'block');
            $('.fab_field').css('display', 'display');
            // $('.chat_login').css('display', 'block');
            $('.fab_field').css('display', 'display');
            break;
      // case 2:
           // $('')
    }
}

