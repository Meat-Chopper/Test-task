class TestTask.Views.ProductsIndex extends Backbone.View
  template: JST['products/index']

  initialize: ->
    _thisView = this
    @collection.fetch({reset: true}).done ->
      _thisView.reset()
      return
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

  reset: ->
    @collection.each (item) ->
      newItem = new TestTask.Views.ProductsItem(model: item)
      modelInCart = TestTask.cartItems.findWhere(id: item.get('id'))
      if modelInCart?
        quantityInCart = modelInCart.get('quantity')
        newQuantity = item.get('quantity') - quantityInCart
        if newQuantity >= 0
          item.set 'quantity', newQuantity
        else
          item.set 'quantity', 0
          if quantityInCart + newQuantity > 0
            modelInCart.set('quantity', quantityInCart + newQuantity)
          else
            TestTask.cartItems.remove modelInCart
    @render()
    return
