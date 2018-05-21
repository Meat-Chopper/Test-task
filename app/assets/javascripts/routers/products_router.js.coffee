class TestTask.Routers.Products extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new TestTask.Collections.Products()

  index: ->
    view = new TestTask.Views.ProductsIndex(collection: @collection)
    $('#container').html(view.render().el)
