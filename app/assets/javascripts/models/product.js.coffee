class TestTask.Models.Product extends Backbone.NestedAttributesModel
  total: ->
    total = @get('price') * @get('quantity')
    @set 'total', total
    total

  quantity: (type) ->
    qty = @get('quantity')
    @set 'quantity', if type == 'increase' then ++qty else --qty
    return
