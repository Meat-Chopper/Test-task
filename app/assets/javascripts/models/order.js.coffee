class TestTask.Models.Order extends Backbone.NestedAttributesModel
  relations: [
    key: 'order'
    relatedModel: ->
      TestTask.Models.Product
  ]

  save: (customer_name, customer_phone) ->
    @.set 'customer_name', customer_name
    @.set 'customer_phone', customer_phone
    $('#errors').empty()
    response = Backbone.sync('create', @, url: '/api/orders', contentType: 'application/json')
    response.done ->
      TestTask.cartItems.reset()
      Backbone.history.navigate '/', trigger: true
      return
    response.error (data) ->
      for key of data.responseJSON
        $('#errors').append "<div>#{key}: #{data.responseJSON[key]}</div>"
      return
    return
