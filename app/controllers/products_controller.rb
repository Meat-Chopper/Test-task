class ProductsController < ApplicationController
  respond_to :json

  def index
    # TODO: paginate
    render json: Product.select('id, name, price, quantity')
  end
end
