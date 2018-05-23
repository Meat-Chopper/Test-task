class TestTask.Views.ShoppingCart extends Backbone.View
  initialize: ->
    @collection = TestTask.cartItems
    @emptyCart()
    @collection.on 'add remove change:quantity', ((item) ->
      Cookies.set 'order', JSON.stringify(@collection.toJSON())
      @rerender()
    ), this
    @rerender()
    return

  emptyCart: ->
    $('#buy').hide()
    $('#cart-items').html '<tr><td colspan="4">Cart is empty</td></tr>'
    return

  add: (item) ->
    $('#buy').show()
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
    $('#cart-items').empty()
    @collection.each ((item) ->
      newItem = new TestTask.Views.ShoppingCartItem(model: item)
      $('#cart-items').append newItem.render().el
      return
    ), this
    this

  rerender: ->
    @render()
    @updateTotal()
    $('#buy').show()
    if @collection.length == 0
      @emptyCart()
    return
