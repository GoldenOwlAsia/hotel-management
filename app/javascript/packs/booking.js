$(document).on('click', '.booking__add-customers', function () {
  $('.booking__customer-icons-wrapper').toggle('show-room-members');
});

$(document).on('click', '.plus-btn', function () {
  let $input = $(this).siblings('.input').find('input');
  $input.val(Number($input.val()) + 1);

  // update service total price if this input is in the booking services section
  if ($input.parents('.booking__service-wrapper').length == 1){

    // get the service price
    let price = Number($input.data('price'));
    let input_value = Number($input.val());

    // get span tag value which represents the price
    let totalPriceSpanTag= $input.parents('.booking__service-input').next('.service_total_price').find('span');

    // add comma every 3 digits
    let total_price = (price*input_value).toLocaleString('en');

    totalPriceSpanTag.text(total_price);
  }
});

$(document).on('click', '.minus-btn', function () {
  let $input = $(this).siblings('.input').find('input');
  $input.val(Math.max(Number($input.val()) - 1, 0));

  // update service total price if this input is in the booking services section
  if ($input.parents('.booking__service-wrapper').length == 1){

    // get the service price
    let price = Number($input.data('price'));
    let input_value = Number($input.val());

    // get span tag value which represents the price
    let totalPriceSpanTag= $input.parents('.booking__service-input').next('.service_total_price').find('span');

    // add comma every 3 digits
    let total_price = (price*input_value).toLocaleString('en');

    totalPriceSpanTag.text(total_price);
  }

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
