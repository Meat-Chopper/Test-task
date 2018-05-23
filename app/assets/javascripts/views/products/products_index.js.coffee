class TestTask.Views.ProductsIndex extends Backbone.View
  template: JST['products/index']

  initialize: ->
    @collection.fetch({reset: true})
    @collection.on('reset', @render, this)
    return

  render: ->
    $(@el).html(@template)
    @collection.each ((item) ->
      newItem = new TestTask.Views.ProductsItem(model: item)
      $('#products').append newItem.render().el
      return
    ), this
    TestTask.cart = new TestTask.Views.ShoppingCart().render()
    this
