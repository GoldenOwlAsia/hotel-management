$(document).on('turbolinks:load', function () {

  $('.sub-header__filter-default').on('click', function () {
    $('.sub-header__filter-content').toggle('.hide-filter-content');
  });

  $('.sub-header .header_menu .left-side img.menu-icon').on("click", function () {
    var img = this.src;
    if (img.indexOf('menu.svg') != -1) {
      this.src = '/assets/icons/cross.svg';
      $('#header_side_menu').removeClass('hide');
      $('#header_side_menu').addClass('show');
    } else {
      this.src = '/assets/icons/menu.svg';
      $('#header_side_menu').removeClass('show')
      $('#header_side_menu').addClass('hide')
    }
  });

  // toggle up the filter content if click out side the filter div
  $(document).mouseup(function (e) {
    if ($(e.target).closest('.sub-header__filter-default').length === 0) {
      if ($('.sub-header__filter-content').css("display") == 'block') {
        $('.sub-header__filter-content').toggle('.hide-filter-content');
      }
    }
  });

});
