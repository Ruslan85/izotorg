namespace :db do
  desc "Fill database"
  task populate: :environment do
    5.times do |n|
      title  = "number #{n+1}"
      content  = "manufacturer number #{n+1} - Susantha Goonatilake writes that the development of the Fibonacci sequence is attributed in part to Pingala (200 BC), later being associated with Virahanka (c. 700 AD), Gopāla (c. 1135), and Hemachandra (c. 1150).[5] Parmanand Singh cites Pingala's cryptic formula misrau cha (the two are mixed) and cites scholars who interpret it in context as saying that the cases for m beats (Fm+1) is obtained by adding a [S] to Fm cases and [L] to the Fm−1 cases. He dates Pingala before 450 BC.[12]"
      manufacturer = Manufacturer.create!(title: title, 
                                          content: content)
      5.times do |i|
        title  = "number #{i+1}"
        content  = "micropost number #{i+1} - The Fibonacci sequence appears in Indian mathematics, in connection with Sanskrit prosody.[6][11] In the Sanskrit oral tradition, there was much emphasis on how long (L) syllables mix with the short (S), and counting the different patterns of L and S within a given fixed length results in the Fibonacci numbers; the number of patterns that are m short syllables long is the Fibonacci number Fm + 1.[7]"
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
