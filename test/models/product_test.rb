require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(name: 'first ', quantity: 1, price: 1.01)
  end

  test 'should be valid' do
    assert @product.valid?
  end

  test 'name should be present' do
    @product.name = '     '
    assert_not @product.valid?
  end

  test 'quantity should be greater or equal 0' do
    @product.quantity = -1
    assert_not @product.valid?
  end

  test 'price should be greater or equal 0' do
    @product.price = -1.01
    assert_not @product.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @product.dup
    duplicate_user.name = @product.name.strip
    @product.save
    assert_not duplicate_user.valid?
  end
end
