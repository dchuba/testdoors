$(document).ready(function () {
  /* фуекция расчета стоимости и заполняемости параметров */
  function visibleBtn(){
    let btn_paiting = btn_film = btn_handle = btn_select = false;
    let price = 0;
    $('form.doors-config_form').find('input[name*="paiting"]').each(function(){
      if ($(this).is(':checked')){
        btn_paiting = true;
      }
    });
    $('form.doors-config_form').find('input[name*="film"]').each(function(){
      if ($(this).is(':checked')){
        btn_film = true;
      }
    });
    $('form.doors-config_form').find('input[name*="handle"]').each(function(){
      if ($(this).is(':checked')){
        btn_handle = true;
      }
    });
    btn_select = true;
    $('form.doors-config_form').find('select').each(function(){
      if ($(this).val() == ''){
        btn_select = false;
      }
    });
    $('form.doors-config_form').find('input:checked').each(function(){
      price = price + ($(this).data('price')||0)*1;
    });
    $('form.doors-config_form').find('option:selected').each(function(){
      price = price + ($(this).data('price')||0)*1;
    });
    $('#btn-submit').toggle(btn_paiting && btn_film && btn_handle && btn_select);
    $('#price-rezult').text(price);
    $('input[name="config-price"]').val(price);
    $('#price').toggle(btn_paiting && btn_film && btn_handle && btn_select);
  }
  /* открытие окна параметров */
  $('.js-select').click(function(){
      let config_container = $(this).data('src');
      if (!$(this).hasClass('active')){
        $('.config-container.active').removeClass('active').slideUp( "slow");
        $('.js-select.active').removeClass('active');
        $(config_container).slideDown( "slow");
        $(config_container).addClass('active');
        $(this).addClass('active');
      }
  });
  /* закрытие окна параметров */
  $('.js-close').click(function(){
      let config_container = $(this).parents('.config-container');
      $(config_container).slideUp( "slow");
      $('.js-select[data-src="#'+config_container.attr('id')+'"]').removeClass('active');
  });
  /* отображение цвета */
  $('.config-color').change(function(){
      let config_container = $(this).parents('.config-container');
      $('.js-select[data-src="#'+config_container.attr('id')+'"]').text($(this).data('title'));
      visibleBtn();
  });
  $('input[id*="paiting"]').change(function(){
    let paiting = $(this).data('color');
    $('.cant-paiting').css({"borderColor":paiting});
    $('.panel-paiting').css({"backgroundColor":paiting});
  });
  $('input[id*="film"]').change(function(){
    let film = $(this).data('color');
    $('.panel-film').css({"backgroundColor":film});
  }); 
  $('input[id*="handle"]').change(function(){
    let handle = $(this).data('color');
    $('.doors-handle').css({"backgroundColor":handle});
  });  
  /* аксесуаров выбор */
  $('.config-check').change(function(){
      let config_container = $(this).parents('.config-container');
      let config_button = $('.js-select[data-src="#'+config_container.attr('id')+'"]');
      let config_val=[];
      $(config_container).find('.config-check:checked').each(function() {
        config_val.push($(this).data('title'));
      });
      if (config_val.length > 0){
        config_button.text(config_val.join(", "));
      }else{
        config_button.text('Выбрать');
      }
      visibleBtn();
  });
  /* выпадающий список */
  $('select[id*="config"]').change(function(){
    $(this).find('option').each(function() {
      if($(this).val() == '') $(this).hide();
    });
    visibleBtn();
  });
  /* смена ориентации двери */
  $('select[id*="opening"]').change(function(){
    let opening = $(this).val();
    if (opening == 19){
        $('.doors-front').css({"transform":"scaleX(1)"});
        $('.doors-back').css({"transform":"scaleX(1)"});
    }else{
      $('.doors-front').css({"transform":"scaleX(-1)"});
      $('.doors-back').css({"transform":"scaleX(-1)"});
    }
    
  }); 
  
  $('#btn-submit').click(function(e){
    e.preventDefault();
    let config_form = $('form.doors-config_form')['0'];
    let config_data = new FormData(config_form);
    $('#btn-submit').hide();
    $.ajax({
        type: "POST",
        url: "core/submit.php",
        data: config_data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 5000,
        success: function (data) {
            console.log("SUCCESS : ", data);
            $('#link-pdf').prop('href', data);
            $('#link-pdf').show();
        },
        error: function (e) {
            console.log("ERROR : ", e);
        }
    });
  });
  
});