class OrderHashValidator < ActiveModel::Validator
  def validate(record)
    if record.order.is_a?(Array)
      record.order.each do |o|
        if !o.is_a?(Hash) || !o['quantity'].is_a?(Integer) || o['quantity'] <= 0 ||
            Product.find_by_id(o['id']).nil?
          record.errors[:base] << "The part of the order is invalid #{o}"
        end
      end
    else
      record.errors[:base] << "The order hash should be an array #{record.order}"
    end
  end
end

class Order < ApplicationRecord
  before_validation {customer_name.strip! && customer_phone.strip!}
  validates :customer_name, presence: true
  validates :customer_phone, presence: true
  validates :order, presence: true
  validates_with OrderHashValidator

  def save_and_update_products
    begin
      Order.transaction do
        order.each do |p|
          product = Product.find_by_id p['id']
          product.quantity -= p['quantity']
          product.save
        end
        save
      end
    rescue
      false
    end
  end
end
