window.TestTask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new TestTask.Routers.Products()
    new TestTask.Routers.Orders()
    TestTask.items = new TestTask.Collections.Products
    TestTask.cartItems = new TestTask.Collections.Products
    TestTask.cartItems.on 'add', (item) ->
      item.set 'quantity', 1
      return
    TestTask.cart = new TestTask.Views.ShoppingCart
    Backbone.history.start({pushState: true})


documentReady = ->
  TestTask.initialize()

  $(document.body).on 'click', 'a', (event) ->
    Backbone.history.navigate $(this).attr('href'), trigger: true
    false
  return

$(document).on 'page:load', documentReady
$(document).ready documentReady
