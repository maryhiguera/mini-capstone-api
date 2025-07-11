Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://mini-capstone.peterxjang.com", "http://localhost:5173", "mini-capstone-frontend.netlify.app"
    resource "*",
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
