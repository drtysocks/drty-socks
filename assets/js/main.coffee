require.config
  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min'
    modal: '/js/vendor/modal.min'
    stripe: 'https://checkout.stripe.com/checkout'

  shim:
    modal:
      deps: ['jquery']

require ['jquery', 'modal', 'stripe'], ($) ->

  #quantity
  $(".plus").on "click", ->
    $('input').val parseFloat($('input').val()) + 1

  $(".minus").on "click", ->
    unless parseFloat($('input').val()) == 1
      $('input').val parseFloat($('input').val()) - 1 unless $('input').val() == 1


  #modal
  $('.buy-now').on 'click', -> $('#modal').modal()

  #close modal with esc key
  $(document).keyup (e) -> $.modal.close() if e.keyCode is 27

  $('.stripe-container').on 'click', -> $.modal.close()

  #stripe

  $('#pay-now').on "click", ->
    quant = parseFloat($('input').val())
    StripeCheckout.open
      name: 'Drty Socks'
      amount: quant * 1000
      description: "($#{quant * 10})"
      image: "/img/square-image.png"

  # handler = StripeCheckout.configure(
  #   key: "pk_test_Z6nPjP07pia8cwGsDoIJzgHQ"
  #   token: (token, args) ->
  # )

  # # Use the token to create the charge with a server-side script.
  # document.getElementById("customButton").addEventListener "click", (e) ->
    
  #   # Open Checkout with further options
  #   handler.open
  #     name: "Demo Site"
  #     description: "2 widgets ($20.00)"
  #     amount: 2000

  #   e.preventDefault()


