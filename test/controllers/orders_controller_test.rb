require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product1 = products(:one)
    @product2 = products(:two)
    @order = orders(:one)
  end

  test 'should get index' do
    get '/api/orders'
    assert_response :success
  end

  test 'should create order' do
    assert_difference('Order.count') do
      post '/api/orders', as: :json,
           params: {customer_name: @order.customer_name, customer_phone: @order.customer_phone,
                    order: [
                        {id: @product1.id, name: 'quis consectetur quia', quantity: 2, price: '51.37', total: 102.74},
                        {id: @product2.id, name: 'vero ea vel', quantity: 3, price: '66.96', total: 66.96}
                    ]}
    end

    assert_response :created
  end

  test 'should not create order' do
    assert_no_difference('Order.count') do
      post '/api/orders', params: {order: {customer_name: '    ', customer_phone: @order.customer_phone,
                                           order: {customer_name: 'first ', customer_phone: '123',
                                                   order: {id: @product1.id, quantity: 2}}}}
      post '/api/orders', params: {order: {customer_name: @order.customer_name, customer_phone: '     ',
                                           order: {customer_name: 'first ', customer_phone: '123',
                                                   order: {id: @product1.id, quantity: 2}}}}
      post '/api/orders', params: {order: {customer_name: @order.customer_name, customer_phone: @order.customer_phone,
                                           order: {customer_name: 'first ', customer_phone: '123',
                                                   order: {id: -1, quantity: 2}}}}
      post '/api/orders', params: {order: {customer_name: @order.customer_name, customer_phone: @order.customer_phone,
                                           order: {customer_name: 'first ', customer_phone: '123',
                                                   order: {id: @product1.id, quantity: 0}}}}
    end
  end
end
