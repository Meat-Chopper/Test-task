require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @product1 = products(:one)
    @product2 = products(:two)
    @order = Order.new(customer_name: 'first ', customer_phone: '123',
                       order: [{id: @product1.id, quantity: 2}, {id: @product2.id, quantity: 3}])
  end

  test 'should be valid' do
    assert @order.valid?
  end

  test 'should not be valid' do
    @order.customer_name = '     '
    assert_not @order.valid?
  end

  test 'name should be present' do
    @order.customer_phone = '     '
    assert_not @order.valid?
  end

  test 'Order hash should be valid' do
    @order.order = {id: @product1.id, quantity: 0}
    assert_not @order.valid?
    @order.order = {id: -1, quantity: 1}
    assert_not @order.valid?
    @order.order = {quantity: 0}
    assert_not @order.valid?
    @order.order = {id: @product1.id}
    assert_not @order.valid?
    @order.order = nil
    assert_not @order.valid?
    @order.order = ''
    assert_not @order.valid?
    @order.order = {id: 1, quantity: 0}
    assert_not @order.valid?
  end
end
