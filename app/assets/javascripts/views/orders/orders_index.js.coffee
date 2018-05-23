class TestTask.Views.OrdersIndex extends Backbone.View
  template: JST['orders/index']

  initialize: ->
    @collection.fetch({reset: true})
    @collection.on('reset', @render, this)
    return

  render: ->
    $(@el).html(@template(orders: @collection))
    this
