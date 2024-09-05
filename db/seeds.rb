require 'faker'

user = User.first || User.create!(email: 'example@example.com', password: 'password')

Car.destroy_all

car_brands = ["Toyota", "Ford", "Honda", "BMW", "Audi", "Chevrolet", "Mercedes-Benz", "Volkswagen", "Hyundai", "Nissan"]
car_models = {
  "Toyota" => { "Corolla" => 2020, "Camry" => 2019, "Prius" => 2018, "Yaris" => 2019 },
  "Ford" => { "Mustang" => 2020, "Fiesta" => 2019, "Focus" => 2018, "Explorer" => 2020 },
  "Honda" => { "Civic" => 2020, "Accord" => 2019, "CR-V" => 2020, "Fit" => 2019 },
  "BMW" => { "X5" => 2020, "3 Series" => 2019, "5 Series" => 2018, "M4" => 2020 },
  "Audi" => { "A3" => 2020, "A4" => 2019, "A6" => 2018, "Q5" => 2020 },
  "Chevrolet" => { "Impala" => 2020, "Malibu" => 2019, "Camaro" => 2020, "Tahoe" => 2020 },
  "Mercedes-Benz" => { "C-Class" => 2020, "E-Class" => 2019, "S-Class" => 2018, "GLA" => 2020 },
  "Volkswagen" => { "Golf" => 2020, "Passat" => 2019, "Polo" => 2018, "Tiguan" => 2020 },
  "Hyundai" => { "Elantra" => 2020, "Sonata" => 2019, "Tucson" => 2020, "Santa Fe" => 2019 },
  "Nissan" => { "Altima" => 2020, "Sentra" => 2019, "Maxima" => 2018, "Murano" => 2020 }
}

20.times do
  brand = car_brands.sample
  model = car_models[brand].keys.sample
  year_of_production = car_models[brand][model]

  rating = rand(200..500) / 100.0
  rating = [[rating, 5.00].min, 2.00].max

  car = Car.create(
    brand: brand,
    model: model,
    year_of_production: year_of_production,
    address: Faker::Address.full_address,
    price_per_day: Faker::Number.between(from: 50, to: 100),
    image: "Car/car#{Faker::Number.between(from: 1, to: 10)}.jpg",
    rating: rating,
    user: user
  )
end

puts "Created #{Car.count} cars."
