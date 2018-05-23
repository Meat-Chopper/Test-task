class TestTask.Views.OrdersNew extends Backbone.View
  template: JST['orders/new']
  events: 'click #create-order': 'save'

  initialize: ->
    @model = new TestTask.Models.Order()
    @model.set 'order', TestTask.cartItems
    return

  render: ->
    $(@el).html(@template(order: @model, total: TestTask.cartItems.subtotal()))
    this

  save: ->
    @model.save $('#customer_name').val(), $('#customer_phone').val()
    return
