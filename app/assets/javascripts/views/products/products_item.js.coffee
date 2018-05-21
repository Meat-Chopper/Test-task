class TestTask.Views.ProductsItem extends Backbone.View
  template: JST['products/item']
  events: 'click .change-quantity': 'changeQuantity'

  initialize: ->
    @model.on 'change', (->
      @render()
      return
    ), this
    return

  render: ->
    $(@el).html(@template(product: @model))
    this

  changeQuantity: (event) ->
    type = $(event.target).data('type')
    model = TestTask.cartItems.findWhere(id: @model.get('id'))
    if type == 'decrease' && model?
      if model.get('quantity') == 1
        TestTask.cartItems.remove model
      else
        model.quantity type
      @model.quantity 'increase'
    else if type == 'increase' && @model.get('quantity') > 0
      if model?
        model.quantity type
      else
        TestTask.cart.add @model.clone()
      @model.quantity 'decrease'
    return
