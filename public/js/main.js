(function() {
  require.config({
    paths: {
      jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min'
    }
  });

  require(['jquery'], function($) {
    $(".plus").on("click", function() {
      return $('input').val(parseFloat($('input').val()) + 1);
    });
    $(".minus").on("click", function() {
      if (parseFloat($('input').val()) !== 1) {
        if ($('input').val() !== 1) {
          return $('input').val(parseFloat($('input').val()) - 1);
        }
      }
    });
    return $('button.stripe-button-el').on("click", function() {
      var quant;
      quant = parseFloat($('input').val());
      return $("script[data-name='Drty Socks']").attr('data-amount', quant * 1000).attr('data-name', "Drty Socks (" + (quant * 10) + ".00)").attr('data-description', "Drty Socks");
    });
  });

}).call(this);
