require './marketplace_runner'

item_one = Product.new(name: "Lavender heart", code: '001', price: 9.25)
item_two = Product.new(name: "Personalised cufflinks", code: '002', price: 45.00)
item_three = Product.new(name: "Kids T-shirt", code: '003', price: 19.95)

basket = Basket.new

promotional_rules = PromotionalRules.new(spend_limit: 60, percentage: 0.9, code: '001', price: 8.50, quantity: 2)

co = Checkout.new(promotional_rules)

basket.add(item_one)
basket.add(item_two)
basket.add(item_three)

basket.contents.each { |product| co.scan(product) }

puts "Total price expected: £66.78"
puts "Price calculated: £#{co.total}"



