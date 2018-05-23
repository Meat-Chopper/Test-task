class TestTask.Routers.Orders extends Backbone.Router
  routes:
    'orders': 'index'
    'orders/new': 'new'

  index: ->
    @collection = new TestTask.Collections.Orders()
    view = new TestTask.Views.OrdersIndex(collection: @collection)
    $('#container').html(view.render().el)
    return

  new: ->
    view = new TestTask.Views.OrdersNew()
    $('#container').html(view.render().el)
    return
