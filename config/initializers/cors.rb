Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "mini-capstone.peterxjang.com", "localhost:5173", "mini-capstone-frontend-q441.onrender.com"
    resource "*", headers: :any, credentials: true, methods: [:get, :post, :patch, :put, :delete]
  end
end
