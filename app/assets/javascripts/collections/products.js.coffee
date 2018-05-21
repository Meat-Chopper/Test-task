class TestTask.Collections.Products extends Backbone.Collection
  model: TestTask.Models.Product
  url: '/api/products'

  subtotal: ->
    total = 0
    @each (model) ->
      total += model.total()
      return
    total
