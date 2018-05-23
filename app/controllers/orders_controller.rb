class OrdersController < ApplicationController
  respond_to :json

  # GET /orders.json
  def index
    @orders = Order.all
  end

  # POST /orders.json
  def create
    @order = Order.new(order_params)
    if @order.save_and_update_products
      render json: :show, status: :created, location: root_path
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

    def order_params
      params.permit(:customer_name, :customer_phone, order: [:id, :name, :quantity, :price, :total])
    end
end
