  $(document).on('click', '.booking__add-customers', function () {
    $('.booking__customer-icons-wrapper').toggle('show-room-members');
    console.log('Hello');
  });

  $(document).on('click', '.plus-btn', function () {
    let $input = $(this).siblings('.input').find('input');
    $input.val(Number($input.val()) + 1);
  });

  $(document).on('click', '.minus-btn', function () {
    let $input = $(this).siblings('.input').find('input');
    $input.val(Math.max(Number($input.val()) - 1, 0));
  });

  $(document).on('click', '.overlay', function () {
    $('.right-sidebar').hide();
    $('.overlay').hide();
  });

  $(document).on('click','.booking__add-services',function(){
    $('.booking__service-icons-wrapper').toggle('show-services',function(){

      $('.arrow-up').toggleClass('rotate-45');
    });
  });
