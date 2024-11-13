require "http"
require "json"

# Fetch all products
def fetch_products
  base_url = "http://localhost:3000"
  response = HTTP.get("#{base_url}/display_products.json")
  if response.status.success?
    products = JSON.parse(response)
    display_products(products)
  else
    puts "Failed to retrieve products: #{response.status}"
  end
end

# Display each product in the terminal
def display_products(products)
  puts "Available Products:"
  products.each do |product|
    puts "ID: #{product["id"]}"
    puts "Name: #{product["name"]}"
    puts "Price: #{product["price"]}"
    puts "Image URL: #{product["image_url"]}"
    puts "Description: #{product["description"]}"
    puts "-" * 40
  end
end

fetch_products
