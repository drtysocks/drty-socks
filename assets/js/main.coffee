require.config
  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min'
    modal: '/js/vendor/modal.min'

  shim:
    modal:
      deps: ['jquery']

require ['jquery', 'modal'], ($) ->

  #quantity
  $(".plus").on "click", ->
    $('input').val parseFloat($('input').val()) + 1

  $(".minus").on "click", ->
    unless parseFloat($('input').val()) == 1
      $('input').val parseFloat($('input').val()) - 1 unless $('input').val() == 1

  $('button.stripe-button-el').on "click", ->
    quant = parseFloat($('input').val())
    $("script[data-name='Drty Socks']").attr('data-amount', quant * 1000).attr('data-name', "Drty Socks (#{quant * 10}.00)" ).attr('data-description', "Drty Socks" )

  #modal
  $('.buy-now').on 'click', -> $('#modal').modal()

  #close modal with esc key
  $(document).keyup (e) -> $.modal.close() if e.keyCode is 27

  $('.stripe-container').on 'click', -> $.modal.close()