class TestTask.Views.ShoppingCart extends Backbone.View
  # TODO: save to and load from the session
  initialize: ->
    @collection = TestTask.cartItems
    @emptyCart()
    @collection.on 'add remove change:quantity', ((item) ->
      @render()
      @updateTotal()
      if @collection.length == 0
        @emptyCart()
      return
    ), this
    return

  emptyCart: ->
    $('#cart-items').html '<tr><td colspan="4">Cart is empty</td></tr>'
    return

  add: (item) ->
    item.quantity 'increase'
    @collection.add item
    @render()
    return

  updateTotal: ->
    totalItems = 0
    @collection.each (item) ->
      totalItems += item.get('quantity')
      return
    $('#total-items').html totalItems
    $('#total').html @collection.subtotal()
    return

  render: ->
    $('#cart-items').html ''
    @collection.each ((item) ->
      newItem = new TestTask.Views.ShoppingCartItem(model: item)
      $('#cart-items').append newItem.render().el
      return
    ), this
    return
