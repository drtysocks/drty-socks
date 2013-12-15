require.config
  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min'

require ['jquery'], ($) ->
  $(".plus").on "click", ->
    $('input').val parseFloat($('input').val()) + 1

  $(".minus").on "click", ->
    unless parseFloat($('input').val()) == 1
      $('input').val parseFloat($('input').val()) - 1 unless $('input').val() == 1

  $('button.stripe-button-el').on "click", ->
    quant = parseFloat($('input').val())
    $("script[data-name='Drty Socks']").attr('data-amount', quant * 1000).attr('data-name', "Drty Socks (#{quant * 10}.00)" ).attr('data-description', "Drty Socks" )
