products_data = [
  {
    name: "iPhone",
    price: 699,
    image_url: "https://t-mobile.scene7.com/is/image/Tmusprod/Apple-iPhone-16-Ultramarine-frontimage",
    description: "Apples new iPhone 16 for sale slightly used",
  },
  {
    name: "Macbook Pro M3",
    price: 1699,
    image_url: "https://assets.superhivemarket.com/store/product/197026/image/e07f43f769cd20abdbf31b12196532a0.png",
    description: "2023 macbook pro used for sale",
  },
  {
    name: "Airpods",
    price: 199,
    image_url: "https://i5.walmartimages.com/seo/Apple-AirPods-with-Charging-Case-2nd-Generation_8540ab4f-8062-48d0-9133-323a99ed921d.fb43fa09a0faef3f9495feece1397f8d.jpeg",
    description: "apple airpods for sale 3rd generation",
  },
  {
    name: "iPad Pro M4",
    price: 899,
    image_url: "https://www.provideocoalition.com/wp-content/uploads/Apple-M4-chip-iPad-Pro-silver-and-space-black_X.png",
    description: "new 2024 iPad pro with M4 chip for sale slighly used",
  },
  {
    name: "Mac Studio M2",
    price: 1299,
    image_url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mac-studio-witb-202203_FMT_WHH?wid=600&hei=744&fmt=jpeg&qlt=90&.v=1644978878441",
    description: "Apple Mac studio for sale slightly used",
  },
]

products_data.each do |product|
  product = Product.create(
    name: product[:name],
    price: product[:price],
    image_url: product[:image_url],
    description: product[:description],
  )
end
