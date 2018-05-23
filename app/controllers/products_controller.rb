class ProductsController < ApplicationController
  respond_to :json

  def index
    # TODO: paginate
    @products = Product.select('id, name, price, quantity')
    # .where('quantity > ?', 0) if you do not want to show unavailable items
  end
end
