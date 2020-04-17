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
    let amount = Number($input.val());
    let service_id = Number($(this).data("service_id"));
    let booking_id = $("#room_booking_id").val();
    let service_use_id = Number($(this).data("service_use_id"));
    let url = $("#room_booking_ajax_service_use_url").val();

    // get span tag value which represents the price
    let totalPriceSpanTag= $input.parents('.booking__service-input').next('.service_total_price').find('span');

    // add comma every 3 digits
    let total_price = (price*amount).toLocaleString('en');

    totalPriceSpanTag.text(total_price);
    let data = {
      booking_id: booking_id,
      service_id: service_id,
      service_use_id: service_use_id,
      amount: amount
    };
    console.log(data);

    const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
    $.ajax({
      url: '/service_uses/update_service_use',
      dataType: 'json',
      type: 'POST',
      data: JSON.stringify(data),
      headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
              },
      success: function(){
        console.log();
      }
    });
  }
});

$(document).on('click', '.minus-btn', function () {
  let $input = $(this).siblings('.input').find('input');
  $input.val(Math.max(Number($input.val()) - 1, 0));

  // update service total price if this input is in the booking services section
  if ($input.parents('.booking__service-wrapper').length == 1){

    // get the service price
    let price = Number($input.data('price'));
    let amount = Number($input.val());
    let service_id = Number($(this).data("service_id"));
    let booking_id = $("#room_booking_id").val();
    let service_use_id = Number($(this).data("service_use_id"));
    let url = $("#room_booking_ajax_service_use_url").val();

    // get span tag value which represents the price
    let totalPriceSpanTag= $input.parents('.booking__service-input').next('.service_total_price').find('span');

    // add comma every 3 digits
    let total_price = (price*amount).toLocaleString('en');

    totalPriceSpanTag.text(total_price);

    let data = {
      booking_id: booking_id,
      service_id: service_id,
      service_use_id: service_use_id,
      amount: amount
    };
    console.log(data);

    const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
    $.ajax({
      url: '/service_uses/update_service_use',
      dataType: 'json',
      type: 'POST',
      data: JSON.stringify(data),
      headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
              },
      success: function(){
        console.log();
      }
    });
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


$(document).on('click','.cancel_edit',function(){
  $('.right-sidebar').hide();
  $('.overlay').hide();
});
