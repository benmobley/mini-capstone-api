json.array! @products do |product|
  jason.partial! 'products/product', product: product
end

