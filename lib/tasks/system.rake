namespace :db do
  desc "System date"
  task system: :environment do
    make_admin!
  end
end

def make_admin!
  unless Admin.exists?(email: "admin@example.com")
  Admin.create(
    email: "admin@example.com",
    password: "12345678",
    password_confirmation: "12345678")
  end
end