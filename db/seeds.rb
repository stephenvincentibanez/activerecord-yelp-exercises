require 'faker'


# Faker::Name.name      #=> "Christophe Bartell"

# Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"


arr = [spicy = Tag.create(name: "Spicy"),
veg = Tag.create(name: "Vegetarian"),
salty = Tag.create(name: "Salty"),
sweet = Tag.create(name: "Sweet"),
umami = Tag.create(name: "Umami"),
sour = Tag.create(name: "Sour"),
cheap = Tag.create(name: "Cheap"),
expensive = Tag.create(name: "Expensive"),
vegan = Tag.create(name: "Vegan"),
meat = Tag.create(name: "Meat"),
gf = Tag.create(name: "Gluten Free")]

for i in 1..20
    restaurant = Restaurant.create 
    restaurant.name = Faker::Name.name 
    restaurant.save
    for j in 1..10
        dish = Dish.create(restaurant: restaurant)
        dish.name = Faker::Name.name
        dish.save
        for k in 1..3
            dishtag = Dishtag.create
            dishtag.dish = dish 
            dishtag.tag = arr.sample
            dishtag.save
        end
    end
end
