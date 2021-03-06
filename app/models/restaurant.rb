class Restaurant < ActiveRecord::Base 

    has_many :dishes

    def self.mcdonalds
        Restaurant.find_by_name("McDonalds")
    end

    def self.tenth
        Restaurant.all[9]
    end

    def self.with_long_names
        Restaurant.all.select do |r|
            r.name.length > 12
        end
    end

    def self.max_dishes
        Restaurant.all.max_by {|r| r.dishes.size}
    end

    def self.focused
        Restaurant.all.select do |r|
            r.dishes.length < 5
        end
    end

    def self.large_menu
        Restaurant.all.select do |r|
            r.dishes.length > 20
        end
    end

    def all_dishtags
        self.dishes.map do |d|
            d.tags
        end
    end

    def self.vegetarian 
        arr = []
        Restaurant.all.each do |r|
            veg_dishes = Dish.joins(:tags).where(dishes: {:restaurant_id => r.id})
            .where(tags: {:name => "Vegetarian"})
            if veg_dishes.length == r.dishes.length
                arr << r
            end
        end
        arr
    end

    # def self.vegetarian
    #     Restaurant.all.select do |r|
    #         r.all_dishtags
    #     end
    # end

    def self.name_like(name)
        Restaurant.where("name LIKE #{name}")
    end

end