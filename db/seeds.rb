Supplier.create(name: "Apple", email: "apple@apple.com", phone_number: "12345678")
Supplier.create(name: "Amazon", email: "amazon@amazon.com", phone_number: "87654321")

products_data = [
  {
    name: "iPhone",
    price: 699,
    image_url: "https://t-mobile.scene7.com/is/image/Tmusprod/Apple-iPhone-16-Ultramarine-frontimage",
    quantity: 1,
    description: "Apples new iPhone 16 for sale slightly used",
  },
  {
    name: "Macbook Pro M3",
    price: 1699,
    image_url: "https://assets.superhivemarket.com/store/product/197026/image/e07f43f769cd20abdbf31b12196532a0.png",
    quantity: 1,
    description: "2023 macbook pro used for sale",
  },
  {
    name: "Airpods",
    price: 199,
    image_url: "https://i5.walmartimages.com/seo/Apple-AirPods-with-Charging-Case-2nd-Generation_8540ab4f-8062-48d0-9133-323a99ed921d.fb43fa09a0faef3f9495feece1397f8d.jpeg",
    quantity: 1,
    description: "apple airpods for sale 3rd generation",
  },
  {
    name: "iPad Pro M4",
    price: 899,
    image_url: "https://www.provideocoalition.com/wp-content/uploads/Apple-M4-chip-iPad-Pro-silver-and-space-black_X.png",
    quantity: 1,
    description: "new 2024 iPad pro with M4 chip for sale slighly used",
  },
  {
    name: "Mac Studio M2",
    price: 1299,
    image_url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mac-studio-witb-202203_FMT_WHH?wid=600&hei=744&fmt=jpeg&qlt=90&.v=1644978878441",
    quantity: 1,
    description: "Apple Mac studio for sale slightly used",
  },
]

products_data.each do |product|
  product = Product.create(
    name: product[:name],
    price: product[:price],
    image_url: product[:image_url],
    quantity: 1,
    description: product[:description],
    supplier_id: 1,
  )
end

images = [
  {
    url: "https://t-mobile.scene7.com/is/image/Tmusprod/Apple-iPhone-16-Ultramarine-frontimage",
    product_id: 1,
  },
  {
    url: "https://assets.superhivemarket.com/store/product/197026/image/e07f43f769cd20abdbf31b12196532a0.png",
    product_id: 2,
  },
  {
    url: "https://i5.walmartimages.com/seo/Apple-AirPods-with-Charging-Case-2nd-Generation_8540ab4f-8062-48d0-9133-323a99ed921d.fb43fa09a0faef3f9495feece1397f8d.jpeg",
    product_id: 3,
  },
  {
    url: "https://www.provideocoalition.com/wp-content/uploads/Apple-M4-chip-iPad-Pro-silver-and-space-black_X.png",
    product_id: 4,
  },
  {
    url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mac-studio-witb-202203_FMT_WHH?wid=600&hei=744&fmt=jpeg&qlt=90&.v=1644978878441",
    product_id: 5,
  },
  {
    url: "https://images.macrumors.com/t/AxJ0yAv0Tr_75Dke2Ab5Rl8T-Gc=/1600x0/article-new/2022/10/apple-tv-4k-yellow-bg-feature.jpg",
    product_id: 6,
  },
  {
    url: "https://www.hermesmusic.com/cdn/shop/files/Fender-Classic-Vibe-50s-Stratocaster-Red-guitar-www_hermesmusic_com.jpg?v=1713998174",
    product_id: 7,
  },
  {
    url: "https://www.fmicassets.com/Damroot/Lg/10020/9236091147_fcs_ins_frt_1_rr.png",
    product_id: 7,
  },
]

images.each do |image|
  Image.create(
    url: image[:url],
    product_id: image[:product_id],
  )
end
