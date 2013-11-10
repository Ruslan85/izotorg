namespace :db do
  desc "Fill database"
  task populate: :environment do
    5.times do |n|
      title  = "number #{n+1}"
      content  = "manufacturer number #{n+1}"
      manufacturer = Manufacturer.create!(title: title, 
                                          content: content)
      5.times do |i|
        title  = "number #{i+1}"
        content  = "micropost number #{i+1}"
        manufacturer.products.create!(title: title,
                                      content: content)
      end
    end

    User.create!(name: "Ruslan",
                email: "Ret85@mail.ru",
                password: "12345678",
                password_confirmation: "12345678")      
    4.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@mail.ru"
      password  = "password"
      user = User.create!(name: name, 
                          email: email,
                          password: password,
                          password_confirmation: password)
    end
  end
end
