class TestTask.Views.ShoppingCartItem extends Backbone.View
  template: JST['shopping_cart/item']

  initialize: ->
    @render()
    @model.on 'change', (->
      @render()
      return
    ), this
    return

  render: ->
    $(@el).html(@template(product: @model))
    this
