require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
    get orders_path
    assert_response :success
    get orders_new_path
    assert_response :success
  end
end
