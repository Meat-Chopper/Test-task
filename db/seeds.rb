Product.destroy_all
99.times do
  name = Faker::Lorem.words.join ' '
  quantity = Faker::Number.number 1
  price = Faker::Number.decimal 2, 2
  Product.create!(name: name, quantity: quantity, price: price)
end
