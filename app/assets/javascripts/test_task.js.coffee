window.TestTask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new TestTask.Routers.Products()
    new TestTask.Routers.Orders()
    TestTask.cartItems = new TestTask.Collections.Products
    TestTask.cartItems.set JSON.parse(Cookies.get('order')) if Cookies.get('order')
    TestTask.cartItems.on 'add', (item) ->
      item.set 'quantity', 1
      return
    Backbone.history.start({pushState: true})


documentReady = ->
  TestTask.initialize()

  $(document.body).on 'click', 'a', (event) ->
    Backbone.history.navigate $(this).attr('href'), trigger: true
    false
  return

$(document).on 'page:load', documentReady
$(document).ready documentReady
