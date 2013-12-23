(function() {
  require.config({
    paths: {
      jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min',
      modal: '/js/vendor/modal.min',
      stripe: 'https://checkout.stripe.com/checkout'
    },
    shim: {
      modal: {
        deps: ['jquery']
      }
    }
  });

  require(['jquery', 'modal', 'stripe'], function($) {
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
    $('.buy-now').on('click', function() {
      return $('#modal').modal();
    });
    $(document).keyup(function(e) {
      if (e.keyCode === 27) {
        return $.modal.close();
      }
    });
    $('.stripe-container').on('click', function() {
      return $.modal.close();
    });
    $('.mini').on('click', function() {
      var pic;
      pic = $(this).data('index');
      return $('.full').attr('src', "/img/socks-" + pic + ".png");
    });
    return $('#pay-now').on("click", function() {
      var quant;
      quant = parseFloat($('input').val());
      return StripeCheckout.open({
        name: 'Drty Socks',
        amount: quant * 1000,
        description: "($" + (quant * 10) + ")",
        image: "/img/square-image.png"
      });
    });
  });

}).call(this);
